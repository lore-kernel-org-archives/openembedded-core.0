Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8F5116E701
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 20:58:56 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id lx4so4512025iec.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 12:58:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=vKUUZsJubIWmMTFF/JDOXBdgBSFxe2fScRxAToYyH4g=;
	b=WuUP+VbvDoXRN70r+nKbpwTngOJVLBMDgRXT9bGneQygD/9/Nf/ZVPWB1a34rPs99n
	B+92y0vmzbFBe8mGxPyq1S24GLe3adjFhv3nbAAp9HfVqASddPBZrl6KacGu72sQI5He
	OdGhmORYKdaO0YEG7wl9jftQ5NVutIQPyGg2Xg/VVXbm/XLPIcQ6EnKBtkcYbGgq8EyV
	Mj4HAAGlsOK/hy5ILNt+SutGZOgmOvD6DXspXrUxbvAeBS58c0aN+5LrfxFAFCKM0mJ2
	qg1CR3bhydzR4iaPbBW5GbtG3UcoGAi/yYYzUVqNQixReoTa+KKaJKXJtUT5STpOZjdQ
	vtcA==
X-Gm-Message-State: ALoCoQmuIyJtaFfc5nE4ZIuvYwF0nHtkBuoeDZGMYroK4ssMtqjZ1nagyRMj4e9gG6SnY4gYPyIg
X-Received: by 10.43.56.4 with SMTP id wa4mr10078776icb.18.1389905937144;
	Thu, 16 Jan 2014 12:58:57 -0800 (PST)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id g6sm13866306igg.9.2014.01.16.12.58.55
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 16 Jan 2014 12:58:56 -0800 (PST)
Message-ID: <52D8480E.9040308@linaro.org>
Date: Thu, 16 Jan 2014 15:58:54 -0500
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, yocto@yoctoproject.org
References: <52D5B92C.5040001@linaro.org>
In-Reply-To: <52D5B92C.5040001@linaro.org>
Subject: Re: ** bug squashing weekend - Jan 17 to 20, 2014
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
X-List-Received-Date: Thu, 16 Jan 2014 20:58:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hopefully some of you have had the time to peruse the bugzilla database
and have chosen a bug or two you'd like to quash this weekend. The bug
hunt starts Friday Jan 16 and runs until Monday.

If you're looking for more ideas there are some janitorial tasks
outlined here:
https://wiki.yoctoproject.org/wiki/Janitors

