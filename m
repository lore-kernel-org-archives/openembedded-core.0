Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.4107.1593542299031263411
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 11:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=Z1kHXSqY;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=49351; q=dns/txt; s=axis-central1;
  t=1593542299; x=1625078299;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=xaL1Okdp2YxhDjYQZHlnSg+9E780lJZx1FyM9wC2sEg=;
  b=Z1kHXSqYP8wT1vmu7ejysP7zoXRX9DZG4y8oLMjwL6rT0o5bV067xJ+6
   AvPwMgQS3o485cD6u+PlRH/jPf6QhSvmdnjLn1ZKKuhqy83NTPQX76/ca
   AKZ+KnGkLUsSdmpkVBskAbixxt3uI7SAQ4a33YLyJNIH1tN3eCSs2Tw31
   eEm+hy6YpWfkJxynthSO2Wg4EJSrGtgqEdOye6gSW1niW/fpvJYqg54iH
   vFkGVPkQLocS3IbjTENIBaOJao2YuGSGQtOFyu+/1tjSJFD+XS8knDpyG
   iwNpEDkuP94FoGWWNpGKQj0KIHmLg3uENVUNd8KQZRgb9Gc0MH7Bqx+8o
   Q==;
IronPort-SDR: 7o/u4HjTEHxP9YCiE2SWxO7c/wFQhoQMxE0wkTu8F9Co8oG8ROvtJptggQBlULpOCZP/rh+hb5
 o0VDtDba/3Mo+eSWUMGeB0LSeD0+Zgv982cg9MQlL75j7AY4/qVXJAyYitOvohkx7jDfg43OwC
 daa7eusMhJ/qdauDDPKwulSqaTSoX/1Y24SBGeeGFiSOZ7GFLFhsCDesnrQTpptaXV6IDm6riT
 DvdbAdNDJ32KWxgXk9OyRuKNuKmj0TlztTH0ZHE6FSqMBjCZprBPmBeXjZ5VNwurQqdiw8xc8G
 Tls=
X-IronPort-AV: E=Sophos;i="5.75,298,1589234400"; 
   d="bb'?py'?gz'50?conf'50?scan'50,208,49,50,223";a="10060347"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: Alex Stewart <alex.stewart@ni.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: tools-cfpbuild-internal <tools-cfpbuild-internal@axis.com>, "Alejandro Del
 Castillo" <alejandro.delcastillo@ni.com>
Subject: Re: [OE-core] Add package managers as a plugin
Thread-Topic: [OE-core] Add package managers as a plugin
Thread-Index: AQHWSU9UjwcJMyAWUU60rRHKoFsdh6jnwSiAgAmpeHs=
Date: Tue, 30 Jun 2020 18:38:14 +0000
Message-ID: <1593542294400.41926@axis.com>
References: <20200623111328.5838-1-fredrigu@axis.com>,<541d697f-b45d-9416-fed9-d96dc65103e5@ni.com>
In-Reply-To: <541d697f-b45d-9416-fed9-d96dc65103e5@ni.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.20.13.15]
MIME-Version: 1.0
X-Groupsio-MsgNum: 140145
Content-Language: en-US
Content-Type: multipart/mixed; boundary="_002_159354229440041926axiscom_"

--_002_159354229440041926axiscom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Alex,=0A=
Thanks for supplying a script!=0A=
=0A=
I added apk to your script and then ran=0A=
```=0A=
for f in `ls`; do=0A=
printf "$f: "; cat $f | tail -2 | head -1 | awk -F ' ' '{print $3}' | sed -=
e 's/elapsed//'=0A=
done | sort=0A=
```=0A=
=0A=
The result is here:=0A=
out.apk.1: 0:13.35=0A=
out.apk.2: 0:12.89=0A=
out.apk.3: 0:12.99=0A=
out.apk.4: 0:12.87=0A=
out.apk.5: 0:13.02=0A=
out.deb.1: 0:20.27=0A=
out.deb.2: 0:20.30=0A=
out.deb.3: 0:20.33=0A=
out.deb.4: 0:20.06=0A=
out.deb.5: 0:20.17=0A=
out.ipk.1: 0:18.51=0A=
out.ipk.2: 0:18.78=0A=
out.ipk.3: 0:18.80=0A=
out.ipk.4: 0:18.99=0A=
out.ipk.5: 0:18.97=0A=
out.rpm.1: 0:16.80=0A=
out.rpm.2: 0:16.83=0A=
out.rpm.3: 0:16.69=0A=
out.rpm.4: 0:16.78=0A=
out.rpm.5: 0:17.78=0A=
=0A=
That is not supportive of my statement of ipk being the slowest package man=
ager.=0A=
That statement come from timing tests done with our proprietary version of =
poky=0A=
that is somewhat extended when it comes to the do_rootfs task. We're genera=
ting=0A=
a bit more artifacts than poky. However apk is still ~22% faster than rpm a=
nd ~40%=0A=
faster than deb according to the data above.=0A=
=0A=
So I tried your script with core-image-sato-sdk-ptest instead that is a big=
ger image.=0A=
The results where more mixed. There is a huge difference between different =
package=0A=
managers:=0A=
out.apk.1: 1:13.35=0A=
out.apk.2: 1:13.51=0A=
out.apk.3: 1:13.23=0A=
out.apk.4: 1:14.07=0A=
out.apk.5: 1:13.00=0A=
out.deb.1: 3:49.37=0A=
out.deb.2: 3:50.77=0A=
out.deb.3: 3:51.39=0A=
out.deb.4: 3:53.40=0A=
out.deb.5: 3:53.99=0A=
out.ipk.1: 2:38.99=0A=
out.ipk.2: 2:39.07=0A=
out.ipk.3: 2:35.34=0A=
out.ipk.4: 2:36.15=0A=
out.ipk.5: 2:34.55=0A=
out.rpm.1: 1:58.61=0A=
out.rpm.2: 1:59.42=0A=
out.rpm.3: 1:59.70=0A=
out.rpm.4: 1:58.96=0A=
out.rpm.5: 1:58.11=0A=
=0A=
But yeah, I should probably rephrase my cover letter. You'll find a layer f=
or APK that will=0A=
apply on top of my patch serie attached to this email.=0A=
=0A=
Also note that there's a difference between the time to generate a package.=
 Which =0A=
we completely ignore in this measurements. It's not as important since it's=
 being=0A=
cached, but for a fresh build it will be a difference between different pac=
kage managers.=0A=
=0A=
BR=0A=
Fredrik=0A=
=0A=
___________________________=0A=
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Alex Stewart <alex.stewart@ni.com>=0A=
Sent: Wednesday, June 24, 2020 5:18 PM=0A=
To: Fredrik Gustafsson; openembedded-core@lists.openembedded.org=0A=
Cc: tools-cfpbuild-internal; Hugo Cedervall; Alejandro Del Castillo=0A=
Subject: Re: [OE-core] Add package managers as a plugin=0A=
=0A=
On 6/23/20 6:13 AM, Fredrik Gustafsson wrote:=0A=
> When building and having a good cache hit, a significant amount of time i=
s=0A=
> spent in the phase of generating a rootfs, which is really about the=0A=
> performance of the package manager. ipkg is way slower than deb or rpm.=
=0A=
I was interested enough in your comment here to collect a small sampling=0A=
of comparative do_rootfs runs on one of my dev machines.=0A=
=0A=
I used a virgin poky clone and tried to replicate the steps you provided=0A=
in your OP, timing only the execution of `bitbake -c do_rootfs=0A=
core-image-minimal`. I used the debian `time` package for timing. Here's=0A=
what I got:=0A=
=0A=
# Summary=0A=
PM     Avg do_rootfs time (s)=0A=
--     ----------------------=0A=
deb    33.89=0A=
ipk    33.35=0A=
rpm    31.85=0A=
=0A=
# Raw Data=0A=
deb    00:33.54=0A=
deb    00:34.66=0A=
deb    00:33.55=0A=
deb    00:33.23=0A=
deb    00:34.46=0A=
ipk    00:33.96=0A=
ipk    00:34.43=0A=
ipk    00:33.99=0A=
ipk    00:32.17=0A=
ipk    00:32.22=0A=
rpm    00:29.92=0A=
rpm    00:32.31=0A=
rpm    00:31.90=0A=
rpm    00:33.31=0A=
rpm    00:31.80=0A=
=0A=
Based on those results, it seems like all the current PMs are similar in=0A=
terms of execution time. Are there major differences between my test=0A=
setup and yours? And do you already have a layer with APK available that=0A=
I could compare against on my hardware?=0A=
=0A=
This is the crude script I used to automate the test runs:=0A=
=0A=
```=0A=
#!/bin/bash=0A=
set -euxo pipefail=0A=
=0A=
TIME=3D/usr/bin/time=0A=
=0A=
recipe=3Dcore-image-minimal=0A=
=0A=
# Options are:=0A=
#  - 'package_deb' for debian style deb files=0A=
#  - 'package_ipk' for ipk files are used by opkg (a debian style=0A=
embedded package manager)=0A=
#  - 'package_rpm' for rpm style packages=0A=
function set_pkg_man() {=0A=
     pkg_man=3D${1}=0A=
     sed -i "s/\(^PACKAGE_CLASSES ?=3D \)\"\(.*\)\"/\1\"$pkg_man\"/"=0A=
conf/local.conf=0A=
}=0A=
=0A=
function rebuild_recipe() {=0A=
     bitbake -c cleanall $recipe=0A=
     bitbake $recipe=0A=
}=0A=
=0A=
function test_recipe() {=0A=
     local name=3D${1}=0A=
     bitbake -c cleansstate $recipe=0A=
     bitbake -c clean $recipe=0A=
     $TIME bitbake -c do_rootfs -f $recipe 2>&1 | tee outs/out.$name=0A=
}=0A=
=0A=
# rpm=0A=
set_pkg_man package_rpm=0A=
rebuild_recipe=0A=
=0A=
test_recipe rpm.1=0A=
test_recipe rpm.2=0A=
test_recipe rpm.3=0A=
test_recipe rpm.4=0A=
test_recipe rpm.5=0A=
=0A=
=0A=
# ipk=0A=
set_pkg_man package_ipk=0A=
rebuild_recipe=0A=
=0A=
test_recipe ipk.1=0A=
test_recipe ipk.2=0A=
test_recipe ipk.3=0A=
test_recipe ipk.4=0A=
test_recipe ipk.5=0A=
=0A=
# deb=0A=
set_pkg_man package_deb=0A=
rebuild_recipe=0A=
=0A=
test_recipe deb.1=0A=
test_recipe deb.2=0A=
test_recipe deb.3=0A=
test_recipe deb.4=0A=
test_recipe deb.5=0A=
```=0A=
=0A=
Thanks,=0A=
=0A=
--=0A=
Alex Stewart=0A=
Software Engineer - LabVIEW Real-Time OS=0A=
National Instruments=0A=
=0A=
alex.stewart@ni.com=0A=
office: +1(512)683-8522=0A=
=0A=

--_002_159354229440041926axiscom_
Content-Type: application/gzip; name="meta-apk.tar.gz"
Content-Description: meta-apk.tar.gz
Content-Disposition: attachment; filename="meta-apk.tar.gz"; size=31444;
	creation-date="Tue, 30 Jun 2020 18:37:54 GMT";
	modification-date="Tue, 30 Jun 2020 18:37:54 GMT"
Content-Transfer-Encoding: base64

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

--_002_159354229440041926axiscom_--
