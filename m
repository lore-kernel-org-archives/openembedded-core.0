Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id B746F6C921
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 18:24:46 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id va2so854878obc.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 10:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=OLIURcASVw9evOnj/BeFhcQxR616DTCMgKVbXkdNdjE=;
	b=wf/qZxWoyWHzXWncwNNinIDuJpYXZ2Vvwsfo54isknd/b+bTFpAKf1pq7Ti++nb9d+
	1a5cc8byaLEQBBZiUz7NufHrIWvEJm4Fvu2/SGukHr1NsF5o6OH7kb8WBAg+A8aqpDGk
	vpW/3OdsSY46IB+N3xahUaH20VegXW/S2mR/A2mfvthpoBqTX6ZcgXLz52Mzak7fMTrU
	vx6aHvfSB+1d93lzLOGzNIgYtThWBZVOfYPdd5N2VY4OiWIQML2Wl5sd0CydJWX/7M1+
	kPNlkuPfTQMPaACCZZOFLvclZESK6pyCPxvdQE2jkxnAgFq8HKchSWkgzbXaEyl9V7tn
	bxqg==
MIME-Version: 1.0
X-Received: by 10.182.241.8 with SMTP id we8mr2586304obc.62.1390415087603;
	Wed, 22 Jan 2014 10:24:47 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 10:24:47 -0800 (PST)
In-Reply-To: <52E00ACA.10502@enea.com>
References: <1390405731-19334-1-git-send-email-david.nystrom@enea.com>
	<CAP9ODKqQ1Y-p_tAyMY=Rmw8t4ct7jXqxV=mBaqLdLXXpW+er1g@mail.gmail.com>
	<52E00ACA.10502@enea.com>
Date: Wed, 22 Jan 2014 16:24:47 -0200
X-Google-Sender-Auth: 1fyt35jwn3kQVhzp6_Xa9izI-gU
Message-ID: <CAP9ODKp2yX_rw0GJEmntuhjwr-zzOYVW3Hk3ZS1Yf7Zy3zr1xQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-core-standalone-sdk-target: Add qemuwrapper-cross to target sysroot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jan 2014 18:24:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2014 at 4:15 PM, David Nystr=F6m <david.nystrom@enea.com> w=
rote:
> On 2014-01-22 19:08, Otavio Salvador wrote:
>>
>> On Wed, Jan 22, 2014 at 1:48 PM, David Nystr=F6m
>> <david.c.nystrom@gmail.com> wrote:
>>>
>>> Some postinstall scripts use the qemuwrapper script, so to be able to
>>> offline install these packages outside of the bitbake environment, this
>>> script
>>> needs to be exposed also in the SDK.
>>>
>>> This to enable rootfs generation from a package repository using only a
>>> package repository and the toolchain tarball.
>>>
>>> See https://github.com/nysan/rootfs-sandbox for examples.
>>>
>>> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>
>>
>>
>> Shouldn't this be a RDEPENDS of the postinst package?
>>
>
> Do you mean a RDEPENDS on the run-postinsts package ?
> In that case no.
>
> When $D is set, postinstalls interpret this as a offline install,
> some postinstalls call postinstall-intercepts, which in turn use the
> qemuwrapper script _only_ if $D is set.
>
> run-postinsts should be installed if there are postinstalls which failed =
to
> run during the offline install.
>
> Just to clarify this, the qemuwrapper-cross will only be installed to the
> target SDK sysroot, never on the target rootfs.

No; in postinstall-intercepts RDEPENDS.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

