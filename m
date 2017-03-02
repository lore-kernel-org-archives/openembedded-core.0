Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9710371A0F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 12:08:16 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id 90so51574797ios.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Mar 2017 04:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=j4nAHuOkPG8mw5ggTW78w0Lj40ER8XqsZ/xbJ3JSwSA=;
	b=vSj2K5c9qUYrorxjmKp3EFG9uOgn1fjDiLQxDVW9RePUnOM5uD6XozbAzWMZg7WnqB
	FS6ArIKqcU7T/HFI9YQLg9a92u+ZVYnDhZ/EcROs0+9GLWm+4rM/8Mv1kCE4pJgK+Dbl
	zsIVA9VG98+YyyG/wAVBLkBn7T5CgdSqwzVtM5++1MTQVGkRFfgmN7TfCjffYMWTPwjh
	GQH2BMvoHhyqP0HDXjBV+6+WXSMOVswERA3haXQ44dSOyZjw91t4nOryCBKqY8bINeHY
	tLInurvjTWEkXlESpWIYg4hh2F277dcuWS3y0BK3W5a8hwPSInOhpqxUCo+/KMHbelMc
	2P6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=j4nAHuOkPG8mw5ggTW78w0Lj40ER8XqsZ/xbJ3JSwSA=;
	b=f38QSwfksITsdwdlxELP2xwEju8T9z8lLJMFWUUatpOamJo9T2zqSNi1K7U5Z4TdMX
	z8U0RFqO3vBgatc/YXQPpW7ZCI3O7WOPmj14Yp1UBmYB/1JQI/JGFy759H25b+0wmVaD
	+NTqESK/XUAl/OJnmXU38x0ilmpGyWMCETggXEtnfNZ8Skpf0zsrQO3RjdN+i74I74YM
	rzoQMhiLl84QJUabMnWcMKlcZpTa00FypI8+p0KCHgturlmzxT533pnZ/CfaGgN6rAyV
	YkwfI+9YusoUU+9qNxvuw+1PFDF2Dt8HoTJibnqbDz6R2T8xNaK4dGeBQeAFRDBzURjj
	H+vA==
X-Gm-Message-State: AMke39lHbMvU7lNiaZG2nOdnH2PhXYQStuS2dyN9Ovs4gU2hjz1AisDCNKjw/FRMcZ0I56XE
X-Received: by 10.107.8.85 with SMTP id 82mr12958621ioi.163.1488456497446;
	Thu, 02 Mar 2017 04:08:17 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E17A.dip0.t-ipconnect.de. [93.232.225.122])
	by smtp.gmail.com with ESMTPSA id 10sm5398067itm.12.2017.03.02.04.08.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Mar 2017 04:08:16 -0800 (PST)
Message-ID: <1488456493.7785.229.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 02 Mar 2017 13:08:13 +0100
In-Reply-To: <20170302095908.l5n4l4nwjgpih5f4@piout.net>
References: <1483558126-13685-1-git-send-email-mac@mcrowe.com>
	<20170302095908.l5n4l4nwjgpih5f4@piout.net>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Mike Crowe <mac@mcrowe.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mtd-utils: Upgrade to 2.0.0
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
X-List-Received-Date: Thu, 02 Mar 2017 12:08:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-03-02 at 10:59 +0100, Alexandre Belloni wrote:
> Hi,
> 
> On 04/01/2017 at 19:28:46 +0000, Mike Crowe wrote:
> > Upstream has started using automake which means that the recipe must now
> > inherit from autotools and pkgconfig.
> > 
> > The source tree has been reorganised too which requires the paths in the
> > patches to be modified. None of the patches appear to have been applied
> > upstream.
> > 
> 
> They haven't been applied because they have never been submitted
> upstream (despite being tagged with "Upstream-Status: Pending")

That's the problem with "Pending" - it doesn't really mean that the
original author has specific plans in place to get the patches upstream,
and because there's no systematic tracking of "Pending" patches there's
also no pressure to do so once the patch has been accepted into OE-core.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




