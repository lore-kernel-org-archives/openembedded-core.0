Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 121E97883A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 17:51:23 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id y26so9767747pfi.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 09:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jlx0cniWK1Bfk3fy+y+MjX2bw93NJCsIIS21ynvDV7Q=;
	b=oPHNjhkAy8AyjthudM2c9Xy4Pg5htVO3kjufqbwl9xBjNxe/X+pmFaEpg8bMO1qs1a
	NYkvo5iREk/urXw83wLLosyJdxvwFrY5CnnA+aG5amGa4QW/wVLC7NSX/y8e6QovgJZY
	RuL6Yv7BOD5+s+0qMy10brKiE2hRcZl/riuG9vMwErkWa8vO98XPyb/NsVwG+GSVuYX1
	XJiSZALady89O15KCkbjqFmYWYo5tzI8kJU1pv5dHuKDIV9z4PF6uowptlRybx3Yr1nJ
	nuAYY3zpg8mqhEds8GlMIBHrF01zsABOr77/MS6nNLxq1RHDNPOCaWEB17vhxHTg9nLD
	V9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jlx0cniWK1Bfk3fy+y+MjX2bw93NJCsIIS21ynvDV7Q=;
	b=IDHjxQlz/wqxDJSmNn8e/QswxJ4q0mRbGQgjc5o/rs45Vl5ekHHZ5DAr4X3uHZ3/nP
	WI6mJBvQqDl0pluCBM1JaDBtrK2wlgXA4VMEmNtR5w3XrVF0jcyNJRqeCHG4pSqxbv7F
	3Uu4T7rTfr4WbTUx8av1MOVP/3hthchem+Bg3/Y5mKBCXkcBTTdrPqRfs2RzPkOehpGW
	QXV/6apxEYdgxnE+20YBUawkMHGV9djUfkpNF7Nt1BpzLvQuh6SlgBih+YIb2PbcXCZ3
	bLeGbEH1AWFInNzHJVSvYgyI15i8rKGiPuQJzaj6jB/qUecRMqDo1vEEPlX/x289b9Cp
	hpLQ==
X-Gm-Message-State: AKwxyteQcBM8B/d3FqkN+C+5fCwx1E+27zQuhghyMu5ep3sU2p3JzKI9
	DACu266BXr/ln7CTuOsKoMKh9e1DCMRReAkN8XE=
X-Google-Smtp-Source: AH8x2265AIOtI+E5wC0TqXuSQ+XLovFSURVzRScxxFqtx6pWrpbDHu2YJdpwXYfTSYF+gE27XDDioSyzliRuZyN2B9A=
X-Received: by 10.99.137.195 with SMTP id v186mr24860744pgd.25.1517334685160; 
	Tue, 30 Jan 2018 09:51:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Tue, 30 Jan 2018 09:50:54 -0800 (PST)
In-Reply-To: <CAJTo0La+B4-LxA1_0QzBBssNO-wq50HMeuDPyU5S3iPXQAsyKg@mail.gmail.com>
References: <cover.1517286478.git.raj.khem@gmail.com>
	<CAJTo0La+B4-LxA1_0QzBBssNO-wq50HMeuDPyU5S3iPXQAsyKg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Jan 2018 09:50:54 -0800
Message-ID: <CAMKF1sqj5VjSwj7F5Jji8C7X+aiA3pVg80w6tRzgG08gk+9_9Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 0/8] Update to binutils 2.30, glibc 2.27 initiated fixes, musl update
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
X-List-Received-Date: Tue, 30 Jan 2018 17:51:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 30, 2018 at 4:58 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 30 January 2018 at 04:31, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>> - Add proper sign-offs and Upstream-Status as reported by patchtest
>> - Backport another fix for pulseaudio memfd issue done upstream
>
>
> v1 was merged after v2 was sent so I just split these fixes out and they
> just got merged as follow-up patches.  Sorry but I managed to drop your
> authorship.
>

thats ok. As long as we do it for right reason :)

> Ross

