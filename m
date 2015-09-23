Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8F3207391A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 00:28:40 +0000 (UTC)
Received: by igcpb10 with SMTP id pb10so110229322igc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 17:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=OepFHKRyqQwi+lP33wv6//add6CTw08Pl97DM14voRM=;
	b=mFUtk85wQFH84Zad7sTNakY3gN3Fg1IiXY5vikrSnL+5wBKd4xQ/1x2rS70zTjse5z
	rSLlgzidNv0MnjC11bu5SsoWEpXPl6Nhof/hauNZ+a2OPmWkRECGZ7cAF84J8sJajXiv
	tOkY5wKiqLubq89bXx+gyWJvicc14fRPBfDVzEYO0QsV4c52XVP167JUsec8lXPnRLYz
	7uDmALgMbvUa3pTJCMcY6V8bw7RZChSvYCq3DognUVPPmMAvoFuVoZ4iyvpCmAVcwFO8
	Jz5BpT8/3pws5Rj4TBR44GWS6A/LRHyscRuxjBxexOAXuthNCUMJjNPg/wx6dHo0Yukw
	m8hA==
X-Gm-Message-State: ALoCoQnYwqn3nrpgyNuOUbCzicWr5Ds+2Q84909ZzdoG6fmn6Zx6EmabI8nZh+uYnktwuE/gIvol
X-Received: by 10.50.30.133 with SMTP id s5mr20908629igh.4.1442968120896;
	Tue, 22 Sep 2015 17:28:40 -0700 (PDT)
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com.
	[209.85.223.173])
	by smtp.gmail.com with ESMTPSA id z5sm2189067igl.21.2015.09.22.17.28.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Sep 2015 17:28:39 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioii196 with SMTP id i196so30775584ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 17:28:38 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.160.194 with SMTP id j185mr33735874ioe.37.1442968118557; 
	Tue, 22 Sep 2015 17:28:38 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 22 Sep 2015 17:28:38 -0700 (PDT)
In-Reply-To: <19D16A42-669F-4A59-A1ED-D05C26508E00@gmail.com>
References: <560173B5.1000408@mlbassoc.com>
	<CAP9ODKpcr+YgGsvnRrsxy9Z2xsN5+KP4KiP-UvYij5eyN+1V1g@mail.gmail.com>
	<56019A6B.3070206@mlbassoc.com>
	<CAP9ODKpQDhCL9QbACgMRzV=N_Z7476a1_OxkhV7z0O7PfVd_rQ@mail.gmail.com>
	<5601A857.7060404@mlbassoc.com>
	<03ABB337-6070-4E3E-9D23-151E454481D4@gmail.com>
	<CAP9ODKrmkLw2NQ8SWtSxjXCoUi-Xzmo+4xP3rYmfgkLCPQgqvw@mail.gmail.com>
	<19D16A42-669F-4A59-A1ED-D05C26508E00@gmail.com>
Date: Tue, 22 Sep 2015 21:28:38 -0300
Message-ID: <CAP9ODKpdpMK5jApg7cP3AQ70xEXoC3_V5i_mUGVqBVmTEcY-cw@mail.gmail.com>
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
X-List-Received-Date: Wed, 23 Sep 2015 00:28:42 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 22, 2015 at 8:30 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Sep 22, 2015, at 4:28 PM, Otavio Salvador <otavio.salvador@ossystems.com.br> wrote:
>>
>> On Tue, Sep 22, 2015 at 8:23 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> its normal for build to use libraries from build host for native tools. If we want to abstract that
>>> from host deps then creating a dependency on package-native is the way
>>
>> The point is this seems to be not deterministic. Sometimes this works,
>> others it does not.
>
>
> you can debug it by moving the dependency from default task to earlier or later task and see where its failing sometimes
> some configure might run where we do not expect it to.

I cannot reproduce it locally, just in my autobuilder and now it does
not fail anymore. Gary is the only one seeing it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

