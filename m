Return-Path: <armccurdy@gmail.com>
Received: from mail-vn0-f48.google.com (mail-vn0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id B8DF06ABF7
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 21:34:48 +0000 (UTC)
Received: by vnbg190 with SMTP id g190so8511184vnb.12
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 14:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=W5KnEKDcc6ZhgyF+rBrWW6GJ52Gl8YhAd1Nll8t6wCI=;
	b=0du4v1M7tZa86so9Couw+VUtJXDspUJx/EeZavkKDgq+fcXcKSp8JHHCaJYjTeLVNm
	dj50bl63gxKpRTTLcqMSFx1SnDHVl+uUDn01cVEBfcOxVuWoKilzBC4PdhEQ0D/nBsMb
	0ZoGY2brRjvccP51bZ1wfWL2yRLPxNOLXCuxQuEbTjNsRbjuVxbHYxvWXDsPtANNA5Wz
	YWJ4D8oRNmi08iCasQMfVcCgk3alh/oQ/vfNTQq6ymCQTlyJzhppU4ARrQ5lMcKFjHxt
	4o/8gqnMUD6cPwctCqRjR8KjaoOW7vlV28We2lkiztFM1Muig3T3zow3QneSe5Knfchi
	i26g==
MIME-Version: 1.0
X-Received: by 10.60.34.193 with SMTP id b1mr18129741oej.19.1429047289255;
	Tue, 14 Apr 2015 14:34:49 -0700 (PDT)
Received: by 10.202.102.13 with HTTP; Tue, 14 Apr 2015 14:34:49 -0700 (PDT)
Date: Tue, 14 Apr 2015 14:34:49 -0700
Message-ID: <CAJ86T=Uw=yOfYCmEcx5Ro5of7jKksjxq6WSBOaxPOjMHFp8LoA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <Openembedded-core@lists.openembedded.org>
Subject: autom4te segfault in Dumper.so when configuring intltool
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
X-List-Received-Date: Tue, 14 Apr 2015 21:34:49 -0000
Content-Type: text/plain; charset=UTF-8

I'm seeing messages such as the following appear in syslog when
building intltool or intltool-native from fido:

  [1049484.121948] autom4te[16180]: segfault at 1 ip 00007fea41a7e7fe
sp 00007fff3c666080 error 4 in Dumper.so[7fea41a77000+8000]
  [1049567.199028] autom4te[17012]: segfault at 1 ip 00007f34acc007fe
sp 00007fff5ed84db0 error 4 in Dumper.so[7f34acbf9000+8000]

The segfault happens reproducibly when configuring intltool or
intltool-native (one segfault every time I run or re-run the
run.do_configure script).

There are no obvious errors in config.log and the intltool build
succeeds over-all.

If I hack the intltool run.do_configure script so that the host
machine's perl (v5.18.2) is found instead of perl-native from sysroot
then the segfaults stop.

Is anyone else seeing the same issue?

Andre
--

