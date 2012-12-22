Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TmSgE-0005vh-2h
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Dec 2012 18:16:18 +0100
Received: from mail-ea0-f200.google.com ([209.85.215.200])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 22 Dec 2012 09:00:26 -0800
Received: by mail-ea0-f200.google.com with SMTP id j13so4708815eaa.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Dec 2012 09:01:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:date:from:to:cc:message-id:in-reply-to
	:references:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=rxkZ8WTPhwTvI/gqH8DAu62LIOVcZ0Pqk4xF+jH3hCY=;
	b=IUf/yFehJSopdpc8tYrRAUeL8/GFlLE9k6wqGcuIokgMFC+SDDB/9jg4A24wa4OKRz
	6PeunRGV7Cb55prGqxWpOGrm0o3Ge95akIvG/j8/3eTfmqDnQHgnkKZfpp9yK5h9ly6m
	VEFqha2cydZ4m2jwdy1E8lpHvy+doIaEjRrSkEOsXItYMhOLIk3FB7OFyewGIpQY/Hlv
	APoshBWP9MXgyJ+vGg/29+i1TJph7KTckpwAxwE/wBHLdj9aaRYTFwctyuUt9iyOJTi4
	f1UGpq6vnPJl8KkjTKUcRgmbZQ5lANHDhyMAh5/8MQCYtMSnhz8w1Os1UOa/8vQXV0pc
	+3+w==
X-Received: by 10.181.13.75 with SMTP id ew11mr28522733wid.9.1356195679078;
	Sat, 22 Dec 2012 09:01:19 -0800 (PST)
X-Received: by 10.181.13.75 with SMTP id ew11mr28522722wid.9.1356195678959;
	Sat, 22 Dec 2012 09:01:18 -0800 (PST)
Received: from [192.168.1.13] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id p3sm35028068wic.8.2012.12.22.09.01.17
	(version=SSLv3 cipher=OTHER); Sat, 22 Dec 2012 09:01:18 -0800 (PST)
Date: Sat, 22 Dec 2012 17:01:20 +0000
From: Ross Burton <ross.burton@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <3A52198641724EB2A46E018E68766013@intel.com>
In-Reply-To: <CAP9ODKq=JF3JnjQ-rjxBFQbYEPpRhftDaY0NjcmTpseUVKOg-Q@mail.gmail.com>
References: <cover.1356022882.git.radu.moisan@intel.com>
	<50D38B3E.30003@linux.intel.com> <50D42D58.4010703@intel.com>
	<CAJTo0Lb0AyeZwC6R4M+YjzGxm21d4Q-goSMQ1x0EMAFvCtO6iA@mail.gmail.com>
	<CAP9ODKq=JF3JnjQ-rjxBFQbYEPpRhftDaY0NjcmTpseUVKOg-Q@mail.gmail.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQmuweHxqEGega7x1mygz26aHNllaTKDAAbDmg1hiLB+XbAyr4crT/roOYerR7oqCh9nR3B7gsEN07p/PWo7zSoJfo6T1g5Nkz/Qs/7M8cp0b6uULKlBQZPvnjit62YKEo0KBjl7qk/x1y4bDK2yX06eatJ2uwIXWL/8ysH1CYThmbM/UCev2USGto4RRuvdeE8IyMW3
Cc: Patches, the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/28][RFC] systemd Integration
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
X-List-Received-Date: Sat, 22 Dec 2012 17:16:18 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday, 22 December 2012 at 00:43, Otavio Salvador wrote:
> Sorry but it is not clear what you mean; do you prefer him to squash
> all changes in a single patch or have an initial patch and queue
> patches above this with the fixes?

I prefer a logical series of correct patches, which will probably involve squashing into a single commit and then splitting the pieces out afterwards.

(with a reference to what version of meta-oe the series was based on)

Ross 




