Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U2QS1-0003dE-1c
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 19:07:32 +0100
Received: from mail-gh0-f198.google.com ([209.85.160.198])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 04 Feb 2013 09:51:27 -0800
Received: by mail-gh0-f198.google.com with SMTP id r11so9498039ghr.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 09:51:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=GyEZ1oprHY9Rho9xCoBtt61XCGcMTQtVqnecA8RJnEU=;
	b=SIiutpjEbIx9kgiH6C9nBBrqXxXwQLgN0CzaFjhn9TjJjkXwInU3UuldSN6NNxkuC9
	dC+hhGW269zQroBcJvrCKI19aDICB/1N8ZKiqD0VM7Sp2zx79D/Hd1+dte/TgLCdWOqx
	Q4bP8U8QBCobZ7tVh8G4TgvH9heLgGUly8atYmFRCwYrdjbFh8r7w3YOlak7o29wcST0
	HlN6onPxl1QE0z7B2Ed0qCEhcdfIYw9btJvX7iC1Zyrt9Q2G7Hvs32uHCWDxA1yTVCvh
	Rbvvw98V74E+EYAJD3ZM+8SKIEwaf/7Gy5Mtu2yAHSVXkLnQn8Z3RSMjPddFJh+iXDBo
	IU3Q==
X-Received: by 10.52.178.105 with SMTP id cx9mr20825436vdc.31.1360000286550;
	Mon, 04 Feb 2013 09:51:26 -0800 (PST)
X-Received: by 10.52.178.105 with SMTP id cx9mr20825427vdc.31.1360000286470;
	Mon, 04 Feb 2013 09:51:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Mon, 4 Feb 2013 09:51:05 -0800 (PST)
In-Reply-To: <1360000031.6972.39.camel@phil-desktop.brightsign>
References: <cover.1359968730.git.laurentiu.palcu@intel.com>
	<510F8388.2030809@topic.nl> <510F875B.9070903@intel.com>
	<1360000031.6972.39.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Feb 2013 17:51:05 +0000
Message-ID: <CAJTo0LaBDWRhcf+kj_k6OrV0B0sE98Fnoe5+XAK4gOhPzZTgjw@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQmXEWJbAeH/FymaW0V54v1K8kPjLbQPqpbmHRUy+IumDpjtqdIp1W89NAWmsvDFHBnsBLRtrsOibjg6q0gfhm4cH1N7nmkioiwdffeQM6LXfHd73AnMUQ1giydi/mab9laHKH+FWlZeldC/usYJF1lFqzkL/fDBfat1mSjW0wEPP2nUcw8QtyINIpHemsX29rUAF5rc
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Remove /var/cache from volatiles directory
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
X-List-Received-Date: Mon, 04 Feb 2013 18:07:32 -0000
Content-Type: text/plain; charset=UTF-8

On 4 February 2013 17:47, Phil Blundell <pb@pbcl.net> wrote:
> For example, an (admittedly somewhat unscientific) survey on my desktop
> machine suggests that fontconfig, samba and cups, at least, are creating
> files in /var/cache at run time with contents that you wouldn't be able
> to predict in advance

The fontconfig cache is perfectly capable of generation at image
creation time, and that's actually what prompted removal of /var/cache
from volatiles.

If samba and cups are using /var/cache as something that isn't a
persistent cache, then the should use something like /var/run/
instead.

Ross


