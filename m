Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id E4D8673243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 23:28:59 +0000 (UTC)
Received: by igcpb10 with SMTP id pb10so109607709igc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=eaXs/6X9rSYUuxrs45kwY3NAd9FTcxE+3+kNSrX+Swk=;
	b=UHghQddrjqDXJtgMlKC5/UMSg7VbqTALpwCu9d1cflXRzfIkHMzhrj6Wn4tTAQKygk
	MeONcDhmxV3o4ii8ymJ7YERF5LjPZKWXRb2dU+JRPnV+bzHa/bIMzu+LnA+nFj6kg8uO
	aCgwL+6Vt9IEMwY0yefDAyXi/2haZZ3dMDUGDB1eKOqD3fK3C+33dxXVAF8CCeZKj0Gv
	kvEoaTU5kYWLVZjWUvfGFlAztf/0ThPF3kgpo3aJP4knD1Qy+2xjzyuAzWMo1ASiyRh6
	oVW+B/xLKR+cr8q7NAM3TOrZ2f2bHu5w0Vem/qLCNo7vJa86on054W1CgEL536dh9jwo
	l0Hw==
X-Gm-Message-State: ALoCoQmt3I6MluOdfuFIBF074yaYe2KcxoGp+ZvbVYtnTSpRM/tHW8kCKXJgXrB0e7sB56eamRQF
X-Received: by 10.50.64.210 with SMTP id q18mr20701957igs.15.1442964539339;
	Tue, 22 Sep 2015 16:28:59 -0700 (PDT)
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com.
	[209.85.223.176]) by smtp.gmail.com with ESMTPSA id
	ht6sm2095861igb.11.2015.09.22.16.28.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Sep 2015 16:28:58 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofb144 with SMTP id b144so29894216iof.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:28:57 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.131.134 with SMTP id n6mr34622977ioi.192.1442964537323; 
	Tue, 22 Sep 2015 16:28:57 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 22 Sep 2015 16:28:57 -0700 (PDT)
In-Reply-To: <03ABB337-6070-4E3E-9D23-151E454481D4@gmail.com>
References: <560173B5.1000408@mlbassoc.com>
	<CAP9ODKpcr+YgGsvnRrsxy9Z2xsN5+KP4KiP-UvYij5eyN+1V1g@mail.gmail.com>
	<56019A6B.3070206@mlbassoc.com>
	<CAP9ODKpQDhCL9QbACgMRzV=N_Z7476a1_OxkhV7z0O7PfVd_rQ@mail.gmail.com>
	<5601A857.7060404@mlbassoc.com>
	<03ABB337-6070-4E3E-9D23-151E454481D4@gmail.com>
Date: Tue, 22 Sep 2015 20:28:57 -0300
Message-ID: <CAP9ODKrmkLw2NQ8SWtSxjXCoUi-Xzmo+4xP3rYmfgkLCPQgqvw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Gary Thomas <gary@mlbassoc.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 22 Sep 2015 23:29:02 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 22, 2015 at 8:23 PM, Khem Raj <raj.khem@gmail.com> wrote:
> its normal for build to use libraries from build host for native tools. If we want to abstract that
> from host deps then creating a dependency on package-native is the way

The point is this seems to be not deterministic. Sometimes this works,
others it does not.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

