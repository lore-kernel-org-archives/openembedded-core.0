Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SGGtE-0008LY-Ca
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 23:40:16 +0200
Received: by lbky2 with SMTP id y2so833023lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 14:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=jJIWs1iofwb64dFdUjZH6zO+89gCjUAdkS6D516cb28=;
	b=YzYH4BNWV8a3wMUS1VPrrTIt+BSDDpip88HSmmogAa/Md464u6Lx2U3K2aP0tgR9sl
	tPZ8RLMvpJNaI5itceAXB4ZX42gbaTTTkH7U0UoyEHaJc06Xpyt7Rw4IDhBOWZH8/umu
	2QJOHjrNnpWmCTcyPRxVfQ8OE+9/N1IWCAqK10K6KxKfDXPIuH73qjqiTxIQQuFNwc0i
	SRGBJP+3ABtY5jVrFIo5IIJCpsaKerwi9+hS1PTKE7SNkjm2/4DIEjX0VWCkoolFDzdb
	+g2wVBt2AKGV0BWdPwOCw5rpqjOtM/aZKNQv79YUOCfJK4QC7d+KHFG1w1jcNggVOJuD
	VUxg==
Received: by 10.152.115.38 with SMTP id jl6mr10624075lab.24.1333747862859;
	Fri, 06 Apr 2012 14:31:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 6 Apr 2012 14:30:32 -0700 (PDT)
In-Reply-To: <4F7F28FB.20600@windriver.com>
References: <cover.1333481624.git.mark.hatle@windriver.com>
	<c1765e7544603baa60bec27185a947aeee404bee.1333481624.git.mark.hatle@windriver.com>
	<4F7CC6E6.6020006@opendreambox.org>
	<CAMKF1soi+==bbEKMD+FLdk+8BvWNK3Nj24EJVhoyT5e=_5MvDw@mail.gmail.com>
	<4F7F28FB.20600@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Apr 2012 14:30:32 -0700
Message-ID: <CAMKF1srkXSBHFtO__F9m9TQ=dJzfn+7kfmXoK4=tWknEdc80eg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] conf/machine/include: Cleanup MIPS tunings to match README
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Apr 2012 21:40:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 6, 2012 at 10:33 AM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 4/4/12 11:17 PM, Khem Raj wrote:
>>
>> On Wed, Apr 4, 2012 at 3:10 PM, Andreas Oberritter<obi@opendreambox.org>
>> =C2=A0wrote:
>>>
>>>
>>> What was mipsel-oe-linux before now became mips32el-oe-linux, i.e.
>>> tmp/work/mipsel-oe-linux now is tmp/work/mips32el-oe-linux. I'm not sur=
e
>>> what else broke.
>>>
>>> Was this intentional?
>>
>>
>> I dont think so. mips-*-* in general indicates 32bit BE mips and
>> mipsel-*-* indicates
>> 32bit LE mips so devicing mips32 and mips32el may be more explicit but
>> is not widely
>> used norm
>
>
> If that has changed it was certainly not intentional. =C2=A0As Khem said =
the
> expected GNU canonical archs are:
>
> mips-*-*
> mipsel-*-*
> mips64-*-*
> mips64el-*-*
>
> mips32 should work, but it was not expected to have changed.
>
> Looking through, the GNU canonical arch should only match the above. =C2=
=A0The
> namings in the tmp/work directory are strictly following the -package arc=
h-
> namings, which don't affect system configuration.
>
> I checked the logs from my test builds, and the mips32* reused the mips*
> builds because the canonical arch of the configuration and such were the
> same.
>
> (Looked at config.log in a couple of packages...) =C2=A0if you see mips32=
-* in
> the config.log, let me know.

see angstrom buildhistory its all filled with changes from mips -> mips32
its unwanted.


