Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TEj1t-0003OU-Hh
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 17:51:05 +0200
Received: by iaky10 with SMTP id y10so1739625iak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2012 08:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=uIwR9sYruLrbVntvyvnW4qf5pHZZGXunG4+aKAmKd6I=;
	b=DcaXaVtdSm578fRIv+g5gI9p4bObZInmE6cPooXjlf5KRUuKhIILe1Fd1lKQ6gZZeR
	NEj/ZdYuzb3QunvJgAUvZ9LewxJRU/UPPgGSYXKpTR9iVSeFdr0DpoPf2HsmnaeTOw3n
	kPxtSYJpgGJYVIq6OQdMvI+6ylxyzTKB8lR8XeumW0eYQ4XIEMc9ys68qLFqnZjSJJIs
	V6U4J0BcxldWXqCGel/k8p5eLVFPGYS5BkvKbQ6keG8la3kTf6rSBlKwAWJamDemTaxG
	qfzjihaa9xlQqHh8T1YONpbTvdZKczL2vvxDnflo0WLPB6E2+5LARFxTKJQW0oV2gdKI
	kVaA==
MIME-Version: 1.0
Received: by 10.50.47.129 with SMTP id d1mr2838561ign.45.1348155502112; Thu,
	20 Sep 2012 08:38:22 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Thu, 20 Sep 2012 08:38:22 -0700 (PDT)
In-Reply-To: <5059E5C3.2080603@intel.com>
References: <cover.1348052899.git.laurentiu.palcu@intel.com>
	<CALbNGRTCyvfZFYHx6bKV8oVDJWH3X0tj1DHSJm9CkvT4xY2f7A@mail.gmail.com>
	<5059E5C3.2080603@intel.com>
Date: Thu, 20 Sep 2012 17:38:22 +0200
Message-ID: <CALbNGRS2WzGmRgM0ibnArYgbWWrRVG8VEYayXB12mLcKJmaPAA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [RFC 0/7] Postinstall improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Sep 2012 15:51:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 19, 2012 at 5:33 PM, Laurentiu Palcu
<laurentiu.palcu@intel.com> wrote:
>
>
> On 09/19/2012 04:41 PM, Andreas M=FCller wrote:
>> On Wed, Sep 19, 2012 at 1:49 PM, Laurentiu Palcu
>> <laurentiu.palcu@intel.com> wrote:
>>> Hi,
>>>
>>> It's been quite a long time since I sent the first version of postinsta=
ll
>>> improvements which, after some debate, we decided it needed run-once
>>> support of postinst scriptlets on host. This patcheset (RFC actually) a=
dds
>>> that.
>>>
>>> So, in order to achieve this goal I took advantage of
>>> ROOTFS_POSTPROCESS_COMMAND variable. Basically, if running some postins=
t
>>> scriptlets is time consuming (even on host) and execute repeatedly,
>>> then we can postpone the running and run the scriplet just once. The id=
ea is
>>> to put the scriptlet in the ${WORKDIR}/intercept_scripts directory. Whe=
n the
>>> ROOTFS_POSTPROCESS_COMMAND is executed, it will pick up all the scripts=
 in
>>> this directory and execute them.
>>>
>>> This actual patchset does the above for the gtk icon cache generation w=
hich
>>> takes a very long time to run on target and even on some hosts.
>>>
>>> The people willing to give this patchset a test, are most than welcome.=
 Also,
>>> please feel free to review.
>>>
>>> Thanks,
>>> Laurentiu
>>>
>> Thanks for taking care. I will give it a test tonight and hope to have
>> results tomorrow.
> It would be great if you could give it a try and let me know your results=
.
>
I removed gtk-native append in meta-oe, build from scratch and tested
the image. No issues so far - seems you have done a great job -
Thanks!

Andreas


