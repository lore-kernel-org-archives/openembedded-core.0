Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SAhjT-0000JW-Rn
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 14:07:11 +0100
Received: by lbbgi4 with SMTP id gi4so1593611lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 05:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=oQAe75PuWb2O5v3t2yT4PWgp0hNr2cKg5ujojV4aOTU=;
	b=vOeHprsv4b/0s+xYjWEFR6QSfR57nhfOx4G3zRP46S3XbAfQ0KdSHHagxknh/feU/s
	DWGe9XdWXSh0HWlEzj0CIjK4U1t3m/gWg7VNCwv3PAYYr3nIJXzhzwcwhtD2UNHOlm2c
	SgHqObO35PnZEgUgXJKADWZuz/DrE8hBkSZlVv6sEoGsNmBPb/J1O6ZyVZGlYoGa0CQt
	Cih+7rnRMfM68YSSkaCqy2OfrRdGRv0yzYfSkSevy/RbR+VMTGYIJUMFFMm58dO09CmJ
	D5A+Y+9KtCGgOnQzt/vnC8p+VJhnIvv2Lbi7q1H90BF6L4lZsR2Jf4ulY2VOrAxnTrF1
	Xuaw==
Received: by 10.152.129.69 with SMTP id nu5mr5842570lab.9.1332421096977; Thu,
	22 Mar 2012 05:58:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Thu, 22 Mar 2012 05:57:46 -0700 (PDT)
In-Reply-To: <20120322134340.1af3dfda@eb-e6520>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<ADD6A3980E8C39419A432FF422031B4C0137B406@ORSMSX106.amr.corp.intel.com>
	<20120321203249.54411613@eb-e6520>
	<20120321194906.GC3659@jama.jama.net>
	<ADD6A3980E8C39419A432FF422031B4C0137B557@ORSMSX106.amr.corp.intel.com>
	<20120321220253.00c4f254@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B5A8@ORSMSX106.amr.corp.intel.com>
	<20120321223521.36e49bba@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B66D@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sq7hcTKrzFBYgmUOTcdQw6sC1FG4jUhsfKauqeXLQMgsg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137B889@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srP52bxqwkaqPZTQbRmhp_V+4-iJ7wTKeKWfC1z4W=fyw@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BAA8@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sobw_wT_ZKhXs9Y-d0jSG-QWzKOprgf7+zM8a_BjjQgEQ@mail.gmail.com>
	<20120322131310.1c6455d1@eb-e6520>
	<CAMKF1sqEGjWMpPTQxP3j1bbP6H2FQqAgHZGm399ejC-RyDxboQ@mail.gmail.com>
	<20120322134340.1af3dfda@eb-e6520>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Mar 2012 05:57:46 -0700
Message-ID: <CAMKF1srORF53h-V+fKTjJn2jWg=f6nOaMf_eUmYPLnW-ovc7NQ@mail.gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
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
X-List-Received-Date: Thu, 22 Mar 2012 13:07:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2012 at 5:43 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> you are right :
>
> $ sudo rm ../../lib/python2.7/lib-dynload/readline.so

ok another experiment instead of deleting readline.so make a copy of
it and call it
readline_d.so in the same dir or whereever gdb looks for debug symbols
and see if it still works or do you get the segfault again.


