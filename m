Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id E2AB774D1E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 10:00:25 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id b16so14109638vka.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2018 03:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=T6HsUIaQEJJAi99G7p4nQ/Y0bQCZqn2CvgcqiqrQO/I=;
	b=X7QxdY/jHy3QHcNRnylwoXdTWmP8qWC6WCZQrIQ4hFHL/GYn8x3y2zrL1dqROImqm2
	7no4O2Sl7gsXl+8Y8BBR+kmb2q4kf4FoVIhZlbsl/dMQ/zBmrMT0P8QEAhycWVo1AREZ
	5Ae3LxrtbLO3K6UWeY7qWskHYDASeUdg25djRtcXFPEht6jsc0VsjHg8LMfTfD+vuToM
	OaUPUguUMGO3SqJYN3psuozZrzp/98Lo1VkiFQ/WOupUvBqWiO0HOncJkhlmYSnBljZ5
	v3URBY5qXR35fbYclMlhHqX34ooLF7LsN1KAgSW/TT4QSxpDuFMAUd8OZrDV2+yPu3yu
	jj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=T6HsUIaQEJJAi99G7p4nQ/Y0bQCZqn2CvgcqiqrQO/I=;
	b=OhZY91YfEfFjTVr5sDqvdeWUI8hkAv2RAz09aYSoEtoKfurX+t7E9wTiZuVV2wv3DQ
	deIdx14sIhAJJHBYBp0X58idQYiWs11n/rREu1VQUmyLwv4XlhRJ0C7z5QMEVdQAIFmb
	Niy9vfmLwSIioMMHmWUpWIhIsZ82yl1o/w5249sJQkktNdLXVUIU4bWN7M2bjK37u8wY
	JCRyeT/1pzH3NHxaIvnXnZPuqTJUYJWbfP4ML2p/0KUU+wabdDBAkBU4zzUz0liz0RHF
	P86doNCdtpW0vnCtLxckScr/PhvY9s3nFe1Bp6FIGnLs6s6CJj7OrZsLzZcNwlRp4d3K
	KLCw==
X-Gm-Message-State: ALQs6tCiXZnGkMQYkrFqRPN2gVauZY47JkFNneeYqTLgdF3BySToiUoL
	CRO4WoIqrQYpub6nRM3+i3zbZvMzblzbUC4aUbwILw==
X-Google-Smtp-Source: AIpwx49k93ca7oSfGvcXt4PtSZ8OXhVcd2ep4XE4eVE0WpaBnCXKgNOHHxrpCDj9R5orWuOEq3neUXqu7ezmID/AzKw=
X-Received: by 10.31.179.78 with SMTP id c75mr10564475vkf.128.1522922426196;
	Thu, 05 Apr 2018 03:00:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.219.149 with HTTP; Thu, 5 Apr 2018 03:00:25 -0700 (PDT)
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Thu, 5 Apr 2018 15:30:25 +0530
Message-ID: <CAPGMVzHSCh1VU91Leev0BaZNbzg05U--61WEO1UgcL700_WkBA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: [meta-oe] qemu boot problem
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
X-List-Received-Date: Thu, 05 Apr 2018 10:00:26 -0000
Content-Type: multipart/alternative; boundary="001a1146940c3be8ad056917023d"

--001a1146940c3be8ad056917023d
Content-Type: text/plain; charset="UTF-8"

Hi,

so i completed the core-image-sato build but while running it on qemu i get
the below error.

runqemu - INFO - Running MACHINE=qemux86 bitbake -e...
ERROR: This recipe does not have the LICENSE field set (defaultpkgname)
runqemu - ERROR - bitbake -e
Summary: There was 1 ERROR message shown, returning a non-zero exit code.


Build Configuration:
BB_VERSION           = "1.37.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i586-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "2.4+snapshot-20180405"
TUNE_FEATURES        = "m32 i586"
TARGET_FPU           = ""
meta
meta-poky
meta-yocto-bsp       = "master:80c7ca2c28959d08a59d960d318d8360392bd488"
meta-oe
meta-python          = "master:b9d1d8718834f7287e5a65373b952cbfe9ce83fe"

--001a1146940c3be8ad056917023d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaSw8YnI+PGJyPjwvZGl2PnNvIGkgY29tcGxldGVkIHRoZSBj
b3JlLWltYWdlLXNhdG8gYnVpbGQgYnV0IHdoaWxlIHJ1bm5pbmcgaXQgb24gcWVtdSBpIGdldCB0
aGUgYmVsb3cgZXJyb3IuPGJyPjxkaXY+PGRpdj48YnI+cnVucWVtdSAtIElORk8gLSBSdW5uaW5n
IE1BQ0hJTkU9cWVtdXg4NiBiaXRiYWtlIC1lLi4uPGJyPkVSUk9SOiBUaGlzIHJlY2lwZSBkb2Vz
IG5vdCBoYXZlIHRoZSBMSUNFTlNFIGZpZWxkIHNldCAoZGVmYXVsdHBrZ25hbWUpPGJyPnJ1bnFl
bXUgLSBFUlJPUiAtIGJpdGJha2UgLWUgPGJyPlN1bW1hcnk6IFRoZXJlIHdhcyAxIEVSUk9SIG1l
c3NhZ2Ugc2hvd24sIHJldHVybmluZyBhIG5vbi16ZXJvIGV4aXQgY29kZS48YnI+PGJyPjxicj5C
dWlsZCBDb25maWd1cmF0aW9uOjxicj5CQl9WRVJTSU9OwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAm
cXVvdDsxLjM3LjAmcXVvdDs8YnI+QlVJTERfU1lTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA9ICZx
dW90O3g4Nl82NC1saW51eCZxdW90Ozxicj5OQVRJVkVMU0JTVFJJTkfCoMKgwqDCoMKgID0gJnF1
b3Q7dW5pdmVyc2FsJnF1b3Q7PGJyPlRBUkdFVF9TWVPCoMKgwqDCoMKgwqDCoMKgwqDCoCA9ICZx
dW90O2k1ODYtcG9reS1saW51eCZxdW90Ozxicj5NQUNISU5FwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgPSAmcXVvdDtxZW11eDg2JnF1b3Q7PGJyPkRJU1RST8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgPSAmcXVvdDtwb2t5JnF1b3Q7PGJyPkRJU1RST19WRVJTSU9OwqDCoMKgwqDCoMKg
ID0gJnF1b3Q7Mi40K3NuYXBzaG90LTIwMTgwNDA1JnF1b3Q7PGJyPlRVTkVfRkVBVFVSRVPCoMKg
wqDCoMKgwqDCoCA9ICZxdW90O20zMiBpNTg2JnF1b3Q7PGJyPlRBUkdFVF9GUFXCoMKgwqDCoMKg
wqDCoMKgwqDCoCA9ICZxdW90OyZxdW90Ozxicj5tZXRhwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgPGJyPm1ldGEtcG9recKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPm1ldGEteW9j
dG8tYnNwwqDCoMKgwqDCoMKgID0gJnF1b3Q7bWFzdGVyOjx3YnI+ODBjN2NhMmMyODk1OWQwOGE1
OWQ5NjBkMzE4ZDgzPHdicj42MDM5MmJkNDg4JnF1b3Q7PGJyPm1ldGEtb2XCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCA8YnI+bWV0YS1weXRob27CoMKgwqDCoMKgwqDCoMKgwqAgPSAmcXVvdDtt
YXN0ZXI6PHdicj5iOWQxZDg3MTg4MzRmNzI4N2U1YTY1MzczYjk1MmM8d2JyPmJmZTljZTgzZmUm
cXVvdDs8ZGl2IGNsYXNzPSJnbWFpbC15ajZxbyI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWwtYWRM
Ij48YnI+PC9kaXY+PGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbC15ajZxbyI+PC9kaXY+PGRpdiBj
bGFzcz0iZ21haWwtYWRMIj48YnI+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+DQo=

--001a1146940c3be8ad056917023d--
