Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id C99D16E8E2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 12:27:24 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id q200so926406ykb.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 05:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=DpPOYob9LKf+0q2J4q5NBFGAt/81fqyESfnQTYxSYsc=;
	b=IqG4TmQGwXTUu9RxT49xNpteOBszypTw3BcGXw9auJnizXwLCbyZBIyydtRcYx26hj
	D/JfqPBRkAhp5VqrQIgWEbqk18b4JD0qCrRo0qsUSaTCZ1bpdrR1oSVRCsMYB+rTLPnh
	lupL4cbJ0zWADzUZa1Z0P5Yi+SPS5ISt1Ww82I0fIuWHddeCYv8FbqkmEuN4Cfq9/wGi
	Wk063oRnOdgxdX64LfJWVmEdkarnpJ3V1sXXYGzGDgBAj+AN3stZ1V01HJ/EjfTjM+tL
	GxsfXSRVdu4IboI3pNmPXKW+ozzCLYmpW+rjiXlMxsmwOxOBDhnnxFmjUzRCNa06yCHy
	YwNA==
MIME-Version: 1.0
X-Received: by 10.236.129.227 with SMTP id h63mr520944yhi.148.1395750445193;
	Tue, 25 Mar 2014 05:27:25 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Tue, 25 Mar 2014 05:27:25 -0700 (PDT)
In-Reply-To: <1395426119-3011-2-git-send-email-ross.burton@intel.com>
References: <1395426119-3011-1-git-send-email-ross.burton@intel.com>
	<1395426119-3011-2-git-send-email-ross.burton@intel.com>
Date: Tue, 25 Mar 2014 09:27:25 -0300
X-Google-Sender-Auth: Rld3ufb3DRoreXQqWWvrHwWN6rE
Message-ID: <CAP9ODKoarQQR572240q6E_57CVRaYPHOiShXSWHMxob91Y5MyA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gtk-engines: move engine schemas to a dedicated package
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
X-List-Received-Date: Tue, 25 Mar 2014 12:27:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 21, 2014 at 3:21 PM, Ross Burton <ross.burton@intel.com> wrote:
> The GTK+ engine schemas are not insignicant in size but also mostly useless.
> Put them in a sub-package instead of PN so they only get installed when
> explicitly required.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Isn't it breaking runtime update? People with a running system which
updates it using package feeds are going to get it removed. Am I
missing something?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

