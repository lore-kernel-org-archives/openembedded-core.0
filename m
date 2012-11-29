Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Te4ZO-0000Yb-RG
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 14:54:27 +0100
Received: from mail-ia0-f197.google.com ([209.85.210.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 29 Nov 2012 05:40:09 -0800
Received: by mail-ia0-f197.google.com with SMTP id r13so6136428iar.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 05:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=h8J9/3K6whlsXjcRIuRADDwkcFalNyYbMiFXBniJPE0=;
	b=JX0JGEmDWvR0kYDmn2gXHSqbiHMkKVXWWDW2gEx/8vivwfuvIbXrPE1lOLQqSRreZc
	cqpuYLrXyNzGf52YqL6FfoBvTm7Xg+wJzLcvLBb294r2HbOhghqtDNCSyUVV1v0FxlQP
	RbRffTprv6XvJli9bBTuwidQfzNGglkuwE+/yje7wRFq5BzcCK2+RF5C9eWRhn24kCLb
	+5C/FdTV71ezlISWq0a8ix9vaoTiQB7gntFb7J6ko0O4Bm4NvjxCaQ2RWY1XQL8eY03N
	rL/5/9urB7uDBi+JQcJDuSsQET574h7k7h9Uq3haF16G9yAO5EEVJ4/uzzdT3oo5Er/P
	mf0g==
Received: by 10.60.1.169 with SMTP id 9mr1556943oen.93.1354196407972;
	Thu, 29 Nov 2012 05:40:07 -0800 (PST)
Received: by 10.60.1.169 with SMTP id 9mr1556939oen.93.1354196407851; Thu, 29
	Nov 2012 05:40:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Thu, 29 Nov 2012 05:39:47 -0800 (PST)
In-Reply-To: <50B76322.6000101@mlbassoc.com>
References: <50B76322.6000101@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Nov 2012 13:39:47 +0000
Message-ID: <CAJTo0LaVBOHMipWo=E_=T8mCTMRzB8THg6Ukgt+hDTK2PgvDWA@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Gm-Message-State: ALoCoQlhhKTcuBpnh+dONNJQmhmwYiHBEwaGBzKRoNTDEjMYIORI9Ny64X1oSlKU/inyO3hEUHxGzLW/hHcx7RL99ruXRLXSoyygrOCqjwmmSSTcACEWio/BkWVdx3wUhQghqtSyU4IUp9yLud/FNPXumLko9HFgxpEszutqpfoPia5fWY9C8D+Kd+Gto8BI56hvrzkpDImd
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Where's my X cursor?
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
X-List-Received-Date: Thu, 29 Nov 2012 13:54:27 -0000
Content-Type: text/plain; charset=UTF-8

On 29 November 2012 13:29, Gary Thomas <gary@mlbassoc.com> wrote:
> I'm having troubles with the latest Xorg server.  I have a system
> which has a small display (320x240) with a touch screen.  When I
> bring up X, there is no mouse pointer, even if my touch screen is
> disabled [in the kernel] and I have a "normal" (USB) mouse attached.

Your machine configuration (/etc/formfactor/machconfig) probably says
HAVE_TOUCHSCREEN=1, which results in the X init scripts disabling the
cursor.  Remove that line, comment it out with a #, or set it to 0,
and the cursor should be visible on the next boot.

Ross


