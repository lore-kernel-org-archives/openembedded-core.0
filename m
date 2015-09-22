Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 337DB73243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 23:23:32 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so22341652pad.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Nj8ioikHtkJv3KiFG/a5dKsqIVdoURKvoXyI3XWtvQc=;
	b=A802lRBTrLKFXszwtsl/glMrj7z0OiclbCvipJXv0wdSC/RqObFrFKkQK6bDT7sg92
	yUqyjAJuu3DrmCHoL3v6purAFrLUhku1eQ0bjby+0TYf3c/pkYIwVhT1pBEUVCls4YcB
	D859crwco7hUEY+eJQbcg0jhY87GxXFbt2U1aW/51TPrE8hAsaabH5TBrc7XycSt+o8T
	cX8HG/S2nQ5uW9lEUPrMqcGbZgRN/uk49N/cfcBB0sggRLjqm7FdoifdPc1vnOasMoyI
	7qRYxj0Je+NImeeHeigmD5Zfr3j9BchnFbfBsac6tB0cv+UHZQXN2ntEdqTTBmP88CWO
	grsg==
X-Received: by 10.66.141.238 with SMTP id rr14mr9402782pab.15.1442964212719;
	Tue, 22 Sep 2015 16:23:32 -0700 (PDT)
Received: from [172.16.4.54] ([70.35.39.2]) by smtp.gmail.com with ESMTPSA id
	zf5sm4286302pbc.36.2015.09.22.16.23.30
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Sep 2015 16:23:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5601A857.7060404@mlbassoc.com>
Date: Tue, 22 Sep 2015 16:23:26 -0700
Message-Id: <03ABB337-6070-4E3E-9D23-151E454481D4@gmail.com>
References: <560173B5.1000408@mlbassoc.com>
	<CAP9ODKpcr+YgGsvnRrsxy9Z2xsN5+KP4KiP-UvYij5eyN+1V1g@mail.gmail.com>
	<56019A6B.3070206@mlbassoc.com>
	<CAP9ODKpQDhCL9QbACgMRzV=N_Z7476a1_OxkhV7z0O7PfVd_rQ@mail.gmail.com>
	<5601A857.7060404@mlbassoc.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Mailer: Apple Mail (2.3094)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Error building gdk-pixbuf-native
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
X-List-Received-Date: Tue, 22 Sep 2015 23:23:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Sep 22, 2015, at 12:13 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>=20
> On 2015-09-22 12:38, Otavio Salvador wrote:
>> On Tue, Sep 22, 2015 at 3:14 PM, Gary Thomas <gary@mlbassoc.com> =
wrote:
>>> On 2015-09-22 12:05, Otavio Salvador wrote:
>>>>=20
>>>> On Tue, Sep 22, 2015 at 12:28 PM, Gary Thomas <gary@mlbassoc.com> =
wrote:
>>>>>=20
>>>>> When building gdk-pixbuf-native, I got this error:
>>>>> | DEBUG: Staging files from
>>>>>=20
>>>>> =
/home/local/rpi2_2015-03-05/tmp/work/i686-linux/gdk-pixbuf-native/2.30.8-r=
0/sysroot-destdir/home/local/rpi2_2015-03-05/tmp/sysroots/i686-linux
>>>>> to /home/local/rpi2_2015-03-05/tmp/sysroots/i686-linux
>>>>> | DEBUG: Executing shell function pixbufcache_sstate_postinst
>>>>> | g_module_open() failed for
>>>>>=20
>>>>> =
/home/local/rpi2_2015-03-05/tmp/sysroots/i686-linux/usr/lib/gdk-pixbuf-2.0=
/2.10.0/loaders/libpixbufloader-svg.so:
>>>>> libharfbuzz.so.0: cannot open shared object file: No such file or
>>>>> directory
>>>>>=20
>>>>> It seems that [at least] gdk-pixbuf-native needs harfbuzz-native
>>>>> I looked at the recipe, but it's not 100% obvious to me how to
>>>>> add this, especially w.r.t. all of the PACKAGECONFIG options.
>>>>>=20
>>>>> Guidance?
>>>>=20
>>>>=20
>>>> I had similar failures[1] at O.S. Systems autobuilder and =
rebuilding
>>>> made it work.
>>>>=20
>>>> 1.
>>>> =
http://ci.ossystems.com.br/view/FSL%20Community%20BSP%20-%20master-next/jo=
b/fsl-community-bsp-master-next_wayland-imx28evk/827/console
>>>>=20
>>>> The builds are now succeeding but I did no change to fix it. This
>>>> seems like a race for me.
>>>>=20
>>>> I tried very hard to reproduce the issue locally at my laptop =
without
>>>> success. Do you can reliably reproduce it?
>>>>=20
>>>=20
>>> Yes, I had a full tree and this rebuild was kicked off by a =
meta-data
>>> update.  Once it happened, I tried this:
>>>   % bitbake harfbuzz-native gdk-pixbuf-native -c cleansstate
>>>   % bitbake gdk-pixbuf-native
>>> failed.  However the manual sequence
>>>   % bitbake harfbuzz-native
>>>   % bitbake gdk-pixbuf-native
>>> succeeded.
>>=20
>> I still do not reproduce it :-(
>>=20
>=20
> It seems to be a host [contamination?] issue.  I get this error
> on a build host that does not have libharfbuzz.so installed.  On
> a build host which does, there is no error.
>=20

its normal for build to use libraries from build host for native tools. =
If we want to abstract that
from host deps then creating a dependency on package-native is the way

> Note that it is only for the native package, so perhaps that's
> where the dependency needs to be updated/checked (hence my original
> query)
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


