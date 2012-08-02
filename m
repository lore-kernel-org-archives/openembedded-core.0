Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sx0rI-0000W2-P7
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 21:14:56 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 02 Aug 2012 12:03:14 -0700
Received: by wgbdr13 with SMTP id dr13so5622821wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 12:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:message-id:in-reply-to:references:subject:x-mailer
	:mime-version:content-type:content-transfer-encoding
	:content-disposition:x-gm-message-state;
	bh=+WFLqGKv0ckjUEI9D6lH9VJCqDo7ti+QUA0wHNrTwdM=;
	b=DRuNtg4xVu3ZEywu94U16O88+01xxPizJrVNpbll7/2mhi8iVHDxCfKwieBWfHjNS5
	zA0FXb1kskW5aMTNNcPRyz+d0edPAzq9JOVm5PcJU73fzmHcQDSHB2YiEgcViROPO+5j
	7SZTB5oSPUQAwFYMIb4+IFVAa1v6S2a5H5W25t4DD9oxb+AhxX4T+7aqEE4+6l44MtPH
	soJLtMVSJ4B2aHZEPSjmipvsLGjuKd9k/gwel5AhmmLu8xpkt+UATM9KiPyJ+/7PHHZd
	QRD0l0bXzjNPavIm00bqhN7SoslqB62tulRkVll5LzKfuL/exsE6CD+gY5q/Frl103jw
	MRBg==
Received: by 10.180.78.170 with SMTP id c10mr7022576wix.3.1343934192543;
	Thu, 02 Aug 2012 12:03:12 -0700 (PDT)
Received: from [192.168.1.12] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id b7sm19328135wiz.9.2012.08.02.12.03.10
	(version=SSLv3 cipher=OTHER); Thu, 02 Aug 2012 12:03:11 -0700 (PDT)
Date: Thu, 2 Aug 2012 20:03:09 +0100
From: Ross Burton <ross.burton@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <8242048D6F2A4934B1D6E6CB30CF8C3A@intel.com>
In-Reply-To: <94E6EEF2-BA2A-4B68-A9CB-98133061274E@dominion.thruhere.net>
References: <cover.1343926021.git.ross.burton@intel.com>
	<94E6EEF2-BA2A-4B68-A9CB-98133061274E@dominion.thruhere.net>
X-Mailer: sparrow 1.6.2 (build 1143.6)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQljiIXdxyaaxQSE81Pyxhks6K9kIO1CA3U5YtOXkwqK5V7xOMYIXZHc0RAkDnCGRSou5LF5
Subject: Re: [PATCH V3 00/11] Mesa upgrade/improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 19:14:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday, 2 August 2012 at 19:38, Koen Kooi wrote:
> This will still break every platform with a binary libegl and libgles.

That is true and I'm all ears for suggestions. My best proposal so far is to let a package hint a prefix to the Debian renamer, so these packages get renamed to libmesa-gl, libmesa-egl, etc.

That said I'm very curious how every platform with a binary libgl isn't already broken.  If that works for some reason then voila we have a solution, and if they are already broken then we're not breaking it any more than it was already broken.

Ross




