Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tzuf3-0008QW-KH
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 20:46:38 +0100
Received: from mail-ve0-f198.google.com ([209.85.128.198])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 28 Jan 2013 11:30:53 -0800
Received: by mail-ve0-f198.google.com with SMTP id ox1so2902988veb.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 11:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=DxqL3aeALvYsSHHv2FlPV77HDUJdgEqiWNo9FWx+40o=;
	b=ZLNSO9c0qVxmr6mzPYQ6YGWPAuxamu/+z7vejeUWvZU4fSrZ2FFq6Oqw/ZQI6JBtNI
	5rwSQgbZuyxDOnGtho6UDIw6le8I/1hgKvnwaTGpG9Uw06kSI+o775aYIhHbsbU8zsTe
	zf+ORKWV7llL8iWQcJQ+L+Z5WYONJufizW8P2pEAGCufd+35+EXOqUYv0j4wXaj1+Y8a
	orIAGB44Dvc8OR0ZwCd98Kt80o/EoRPkS4Sk2cCEeYfUwkdbSw4qWBqaX9yYTBv7P43e
	InvYFMORDbLqqybIO/ElO7r0aYiInYk+ly0dhDTd1dFwzhq0/EVXsrUP45PxRlEjnwZE
	RQTg==
X-Received: by 10.52.72.232 with SMTP id g8mr14076126vdv.69.1359401452462;
	Mon, 28 Jan 2013 11:30:52 -0800 (PST)
X-Received: by 10.52.72.232 with SMTP id g8mr14076119vdv.69.1359401452376;
	Mon, 28 Jan 2013 11:30:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.205.236 with HTTP; Mon, 28 Jan 2013 11:30:32 -0800 (PST)
In-Reply-To: <1359401078-13599-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1359401078-13599-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Jan 2013 19:30:32 +0000
Message-ID: <CAJTo0LYtE_FtA0fZ_4Q_cLmnRnsKeC8+Q4e+Rp98q2jTqwMAYw@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Gm-Message-State: ALoCoQmMcu5eo9GsIWPny5y6GxKOKY9TO1wyAxIYjROTuUdpzFl9wWpokW9X1oQxE5lMOWtIZgQX6YJGUOx1DOtBDJaVpHT58KaK+d2Us87laLq0V2kf7abhgttqmHEmXl7oQYdk9RUtQvDi2yEglgyhrseFJyu47gK6fuxJwNDd+DTFGwrdg6yKIfcfSFQOZ8BCG6bsq/XI
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: honor ROOT_HOME
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
X-List-Received-Date: Mon, 28 Jan 2013 19:46:40 -0000
Content-Type: text/plain; charset=UTF-8

On 28 January 2013 19:24, Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:
> Use ${ROOT_HOME} which was added in commit
> a78cd0b3a69b829327cea035321051ab11cba70f.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Acked-by: Ross Burton <ross.burton@intel.com>

Ross


