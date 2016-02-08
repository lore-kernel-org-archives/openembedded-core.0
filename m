Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8887473D27
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 13:11:15 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id d63so193801400ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 05:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:content-type:mime-version:content-transfer-encoding;
	bh=ctbonIx7JD3b+rVovReZDBQcTZaMUOyu6QA0QBR/NZ0=;
	b=IEGOSKW38YfXHn3aRv9whh8EYOk+s8FY1iEeeivHA13I7B6SfCCJVeAmilt324KWC3
	05EuYJyIMM7dytW881ACp85zahTKr7XyXitZ6oNHoiPo+SLQ+hi0GcKLGSNX/pK4fTB6
	b77lkvXRCDRHXDFtI9KzR+QEPLomX1s9tt8iC35QiwthPHA5ISiIIKmJ5LTHfiYW7c8P
	Nu3J0BN+0HxY7izcscvtOnn9SzgamYRApfELdBr0S7jtf5KiQuJ/LkyBQzRv/1I1o4P6
	GvyxmKFil+Cak5XfYu2TWSRFgE5Fr2Z541CI057H/IkU6tZI2S4exIx8Go7PblAskVeR
	Hj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=ctbonIx7JD3b+rVovReZDBQcTZaMUOyu6QA0QBR/NZ0=;
	b=iXAUYdCixEpfVE5PhOZrs/NumvMS0yVSpkTezaw216AtUo7hiJpd0u1Gmh+UT36WlB
	dMYDui+RxFJMZRdulp1OSgI7DAo1NFFzc3fpHfw1uYlYZecYq3wFmiRYlAqFEY2OvMq0
	rxJAJ71xeF1x7IhsEBpiYdVN/yzo3K3tRHWADn3vvfWw0YpVNSu8kKVPRpvvnTBevFbe
	tHirKp9B+YFg6F09ULoBbqk6EaoWpihj1TBqONjonQPA8YM6LX0tAyMtPslWCc3k8iAt
	kfdYSz8/jybFP6CJHO2aW0C0PnV1hxYfCCj65mJRDZ2exts4AniueuWrc2ucCByuigLU
	cRiQ==
X-Gm-Message-State: AG10YOTA7U86QyCC9SP5E3fvndJolbD3G7nkCtGAZJ4+L4oAqrdiYNs3gopJGNz8SQm5ht/U
X-Received: by 10.107.184.135 with SMTP id i129mr21857434iof.4.1454937076586; 
	Mon, 08 Feb 2016 05:11:16 -0800 (PST)
Received: from pohly-mobl1 ([87.165.127.182]) by smtp.gmail.com with ESMTPSA id
	77sm12362510ioh.21.2016.02.08.05.11.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Feb 2016 05:11:16 -0800 (PST)
Message-ID: <1454937068.8641.7.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 08 Feb 2016 14:11:08 +0100
In-Reply-To: <cover.1454135035.git.raj.khem@gmail.com>
References: <cover.1454135035.git.raj.khem@gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] binutils 2.26 upgrade
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
X-List-Received-Date: Mon, 08 Feb 2016 13:11:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2016-01-30 at 06:28 +0000, Khem Raj wrote:
> Upgrade binutils to 2.26

Has anyone besides us encountered issues when compiling u-boot with the
new binutils? It builds, but then fails at runtime. Bug filed at
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9057

So far it is not clear what exactly the problem is, only that reverting
the binutils upgrade avoids it.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




