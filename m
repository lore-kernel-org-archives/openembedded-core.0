Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TSsBb-0003Jo-L0
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 17:27:35 +0100
Received: by mail-ie0-f175.google.com with SMTP id c13so6824466ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2012 09:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=/+PGWk70C4Gr+Pr3+pEJ5mvCvKmKdc2ix/43hIOLst4=;
	b=inS9zHb9QzX72eM4Zbjpzp1ZoIOw2UOyTRWMKFes8Rbvz+/XWwTydC+zbv3kh8ijZ1
	aBkubRyjWlSoG7VxHCl7wLnaIzugISKtjgy1hIApMaKY/tvbDmYW0GSMT/d9vI8616Rm
	9c6O0xFwCP9vzi3rdFONh2isyPX2v+rN0Nk2AOTwls4Sqe0JPMu82m5c8qOeKFbTZfXR
	FVXkPYolL8QmVknD2zl+EFT+FaohR2kFmiCyjvX9kOKBZpcsmak0FeSDpqkayKAijbVr
	cpw4Nv2Hy3l3kdoYwkRyXY+qFbEvlBYBO8GBmjVMVE6dRKUEvBrjrZiA5RKrsORBJObW
	Jmvg==
MIME-Version: 1.0
Received: by 10.42.120.205 with SMTP id g13mr25795771icr.4.1351527240924; Mon,
	29 Oct 2012 09:14:00 -0700 (PDT)
Received: by 10.64.24.175 with HTTP; Mon, 29 Oct 2012 09:14:00 -0700 (PDT)
Date: Mon, 29 Oct 2012 18:14:00 +0200
Message-ID: <CAF6bG8f111en-1a6ppqRVCjgg9Gn7Ywac4tJe+f9KoL4VCdu0Q@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: shadow-native build failure
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
X-List-Received-Date: Mon, 29 Oct 2012 16:27:35 -0000
Content-Type: text/plain; charset=UTF-8

shadow-native do_configure fails with:
cp: cannot stat
'.../tmp-eglibc/sysroots/x86_64-linux/usr/share/gettext/config.rpath':
No such file or directory


 -ML


