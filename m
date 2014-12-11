Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 56AD3601F5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 18:30:11 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id l13so110212iga.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 10:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=CYYH/qt28ktWnHAFrNaTWOlZBOfnTi+TV7fBayPW8Bg=;
	b=gb1Qv2hMNz/o3xku/+9k7Vege2hNajiIr88h2RVoF+GeL0jpfnhRbqs5R3APaYJbRf
	3DgAK7BdhAHlSJcjtHP6zW5zrjrvhtyKSDd5BecPlv8xpyyvFIuzEv9xNSqYSTCXELTN
	qLZnTPZ/W6txAtka2mR0EcXxzge+7XLED/oNcqTb8FX9isI7VSp2iEDFyo8m/xpWDfEg
	ecko/WELpjYRTYPihc00r/a1/AFFdA292HSFRYNma8RA+odRnaLqGAnCoc0c2SUaZI8J
	fBJGH5q0Dk51LoOVQlhD+1x01sAawaXzF+UcD/Gf+hJWCKillh7pqt5JGLcqOna+J2aG
	y4Ow==
X-Gm-Message-State: ALoCoQkxJQumOdE1RQiJ3ymMj+UaRhzsd7OisLWYyzaT/FYiqjdCfV8jk96q2wREGCGHjcaa0B1F
X-Received: by 10.42.72.138 with SMTP id o10mr12267717icj.73.1418322611676;
	Thu, 11 Dec 2014 10:30:11 -0800 (PST)
Received: from [208.114.172.198]
	(xplr-ts-w10-208-114-172-198.barrettxplore.com. [208.114.172.198])
	by mx.google.com with ESMTPSA id a126sm905319ioa.13.2014.12.11.10.30.07
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Dec 2014 10:30:11 -0800 (PST)
Message-ID: <5489E2A9.3060709@linaro.org>
Date: Thu, 11 Dec 2014 13:30:01 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<5487463A.3030103@linaro.org>
	<1504553.gLyqLqD1E0@peggleto-mobl5.ger.corp.intel.com>
	<4747988.F41N2UaoOI@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <4747988.F41N2UaoOI@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Thu, 11 Dec 2014 18:30:19 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Awesome!! I'm giving this update a whirl right now...

...just one small nit... in commit
7d2c6430131ccf94b8bdc185b8cd849fe479d552 the warning message says:

+        lines_before.append('# NOTE: LICENSE is being set to "CLOSED"
to allow you to at least start building - if')
+        lines_before.append('# this is not accurate with respect to the
licensing of the software being built (it')
+        lines_before.append('# will not be for in most cases) you must
specify the correct value before using this')
+        lines_before.append('# recipe for anything other than initial
testing/development!')

Is the "for" in "it will not be for in most cases" out of place? Perhaps
replace with "so", "true" or "accurate"?

