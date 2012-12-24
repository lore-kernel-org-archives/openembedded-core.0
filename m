Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tn4LJ-0007He-FK
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 10:29:06 +0100
Received: from mail-wi0-f198.google.com ([209.85.212.198])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 24 Dec 2012 01:14:14 -0800
Received: by mail-wi0-f198.google.com with SMTP id c10so6163136wiw.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Dec 2012 01:14:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:date:from:to:cc:message-id:in-reply-to
	:references:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=FdyayQvdGEPLJOdGwmDwX7JStvhI4liazhZmU7t4H48=;
	b=DzAPKp3UyWpyQ0d5yihNX6KurMb3jvozWmrplZiqU3xAfPT6foqUlU7RGSbjcRK3Gc
	c3V0SBQXn/ZQrT8eYV/wqCJqCtlLa9VNc72CRQZVnL1SpPFNovA7dhLdpHdxzOaw7bUI
	/U7WcjgKDkRqiYOhHfyqhVMiSymugip30z20d2d/GYSLudWV/H0uzv99MV2ygyeDRRML
	0sseHkfIbu3laWUGKA19P4nvahoFwso95hVEKzB4BNIKK3kAmdQRSxLV8baybP45Psaa
	4V94KUJb1nV9hNYPP8XtA9pQGG/jeO576HSnDhnvzBzvDMSqbc6NdRJhXQgQzbz79yir
	Q0EQ==
X-Received: by 10.180.100.197 with SMTP id fa5mr25995344wib.32.1356340451932; 
	Mon, 24 Dec 2012 01:14:11 -0800 (PST)
X-Received: by 10.180.100.197 with SMTP id fa5mr25995338wib.32.1356340451878; 
	Mon, 24 Dec 2012 01:14:11 -0800 (PST)
Received: from [192.168.1.13] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm3sm42114767wib.9.2012.12.24.01.14.10
	(version=SSLv3 cipher=OTHER); Mon, 24 Dec 2012 01:14:11 -0800 (PST)
Date: Mon, 24 Dec 2012 09:14:14 +0000
From: Ross Burton <ross.burton@intel.com>
To: =?utf-8?Q?Damian=2C_Alexandru?= <alexandru.damian@intel.com>
Message-ID: <1CD17EA59464401087B5B319D15D9437@intel.com>
In-Reply-To: <CAJ2CSBvgHoB-oDR5qu7rsK5erCO+kCf+UEGjwcURnYtm5dWQ0A@mail.gmail.com>
References: <cover.1356094006.git.alexandru.damian@intel.com>
	<45d6f8871229e15a1bca91da7beeee99201ef7a8.1356094006.git.alexandru.damian@intel.com>
	<CAJTo0LbBM0AWg1Trx_ctKqYyC2RLYgkwBcDX=6F=3agOK8SFiA@mail.gmail.com>
	<CAJ2CSBvgHoB-oDR5qu7rsK5erCO+kCf+UEGjwcURnYtm5dWQ0A@mail.gmail.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQk605XoVX5Ur66tvaer0/QLeknJ3Ul6K0uO60pe5W2IpISPSRGzP8TNRakfAK8FnJ2pjHQMerXfoDlbEvhjflz9C7D2RkoMagcIhvkAX7I3ewsb3+YlcsQhzaECovhP39edY6LltD793B7vbXUK9DSf38474511kqzhyB59nBWaI9C2Hic4vFLp/rIM7MyOfOVBbkYm
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] Initial commit for wayland/weston 1.0.3
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
X-List-Received-Date: Mon, 24 Dec 2012 09:29:07 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday, 24 December 2012 at 08:00, Damian, Alexandru wrote:
> One should follow the wayland website for HOWTO-s and testing 
> instructions. 
> 
> Opening a terminal emulator and starting "weston" is the easiest way 
> to get started, regardless if one is under X or in console.
> 
> I don't think the patch comment is the proper place to document this,
> should I add a wiki page ?

Yes, a wiki page with status, known issues, and what's next is a good idea.

Ross 




