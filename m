Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id A1E436018C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 16:18:43 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id ho8so99579037pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 08:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=O7Wz1cySXtNSKIF7uMfBop3z4uM1ofMpwW2ou1D0d1o=;
	b=U1cy+/mQ19ibQT/N6Ea9aGTqIezfxJ5unUj+BgO+BX54FHeUrHNqPrQ3bmGxmT9+9/
	U4gmqHvk7sx4lVeLQ/W7UULher6KzFyG08nc0rT4r5Hg/VJL7Vuwu1wBdK73tYHdd5fg
	LEt2PWn+FMBRN7JzqCCQ+mec3QGHwbwS5BSFEsM3p8Yqwy4/2l1InkOUADeMWd+5Go3N
	Bt9rx0Rk0CeZyGM0IFUFgJveJp7CkoRXrZJbRp1/OIJ3QVK4yhKixY50QeRDKqUabTrm
	+bkWXmFIfQ8eGMI0waNADllYDW4FWFobcDUP5VhDyCHdCKXzk7LrVJNZmC+pVwozvewu
	7i5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=O7Wz1cySXtNSKIF7uMfBop3z4uM1ofMpwW2ou1D0d1o=;
	b=Sm8389rVY4fLx241l6BwxEsisctmG1uCG7tnwNatdPKS8I8P22fAzM5DiMOyyggEgV
	yfbR+8LntBuFahdShQTlC1JQyYRCTfxB40hAs3rkHf/AurT82+YwqC7DiYVlAEzvIstj
	wt9Phcy4aGfMg7eTzyqOgq7nBjbJ7vmxScw6O21VioifH2TEsl1VCQ6NUULYMNJhQEMC
	Bgf2hqJK6HE4vvkwJ+tlAjhvY4goXYeoYPRLGCa+yJ7kfHt5L/lvJVk5qdAHYqEwuV/+
	wz2YTAWd9CUx3JX5BR27Zha7EILyNu+DTUcJp8Q/vNpMDDuO/V1KO0cv4u4TzN2WlUHI
	yzTg==
X-Gm-Message-State: AG10YORtq8Y8lwd7BQv6bLOhIu31NX9WMQqjPMDSSbwHpE5OmWDWR7JrQbCFRLq98iwsAQ==
X-Received: by 10.66.236.129 with SMTP id uu1mr35193749pac.158.1453825124025; 
	Tue, 26 Jan 2016 08:18:44 -0800 (PST)
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com.
	[209.85.192.170]) by smtp.gmail.com with ESMTPSA id
	ux2sm2786877pac.46.2016.01.26.08.18.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jan 2016 08:18:42 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f170.google.com with SMTP id q63so103827906pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 08:18:42 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.87.81 with SMTP id l78mr35227379pfb.101.1453825122042;
	Tue, 26 Jan 2016 08:18:42 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Tue, 26 Jan 2016 08:18:41 -0800 (PST)
In-Reply-To: <20160126161427.GF1652@denix.org>
References: <1453779264-8652-1-git-send-email-denis@denix.org>
	<CAP9ODKoPmBQpmvChLUOADj1B2m-DUPJCeG-cB7Gk1BrPvk4byg@mail.gmail.com>
	<20160126161427.GF1652@denix.org>
Date: Tue, 26 Jan 2016 14:18:41 -0200
X-Gmail-Original-Message-ID: <CAP9ODKreoG189eO6k57u2g+7N5ViKj+hD=gPD=jVd43RREaHAA@mail.gmail.com>
Message-ID: <CAP9ODKreoG189eO6k57u2g+7N5ViKj+hD=gPD=jVd43RREaHAA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] stress-ng: add 0.05.09
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
X-List-Received-Date: Tue, 26 Jan 2016 16:18:46 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 26, 2016 at 2:14 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, Jan 26, 2016 at 02:01:14PM -0200, Otavio Salvador wrote:
>> On Tue, Jan 26, 2016 at 1:34 AM, Denys Dmytriyenko <denis@denix.org> wrote:
>> > From: Denys Dmytriyenko <denys@ti.com>
>> >
>> > A clean room re-implementation and extension of the original stress tool.
>> >
>> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> > ---
>> >  meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb | 15 +++++++++++++++
>> >  1 file changed, 15 insertions(+)
>> >  create mode 100644 meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb
>> >
>> > diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb b/meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb
>> > new file mode 100644
>> > index 0000000..2e92c53
>> > --- /dev/null
>> > +++ b/meta/recipes-extended/stress-ng/stress-ng_0.05.09.bb
>> > @@ -0,0 +1,15 @@
>> > +SUMMARY = "A tool to load and stress a computer system"
>> > +HOMEPAGE = "http://kernel.ubuntu.com/~cking/stress-ng/"
>> > +LICENSE = "GPLv2"
>> > +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> > +
>> > +SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.gz"
>> > +
>> > +SRC_URI[md5sum] = "fe65047991f654ffaac3c59ea9537763"
>> > +SRC_URI[sha256sum] = "d785b5f2df042d42c43ddfd5bbafa19151ed96f0c483d7f44c737f492b52ddd6"
>> > +
>> > +CFLAGS += "-Wall -Wextra -DVERSION='"$(VERSION)"' -O2"
>>
>> Where version comes from?
>
> From the Makefile

And $(VERSION) ? I think you need to use ${PV} here.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

