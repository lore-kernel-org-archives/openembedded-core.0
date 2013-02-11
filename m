Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pmiscml@gmail.com>) id 1U4scJ-0006RK-52
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 13:37:13 +0100
Received: by mail-ee0-f53.google.com with SMTP id e53so3077712eek.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2013 04:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:in-reply-to:references
	:x-mailer:mime-version:content-type:content-transfer-encoding;
	bh=jRBet0xNpk75DoP93EReMesUQ2Hlp0CjgPDr5GDKdIM=;
	b=A4MBxNHC95NswNxYX/lZEQomH8mNSBqlJX/P2H8zRcA/tdM0IppnF9jESY1n2qD2QA
	xP24B4ZUfFkL9bz13axs9098CV3evCwcfSVf4ls6f2wO0Qr5qMlbo/IcRdsTigPpm9P+
	iutN6FWvcvS4z7nB1N9IAfW/sV0TIrcrCFFDoScjuzZmpoc3HEQ66cBJj9dZbjK8bFVS
	BpHCQDuwkVn/dgjdFbD2ntVT6pld1tDbBfZ5VWSjuwLSypgKCoF9MfnxAb8LRzMOtQr6
	VQAO3SP7Cde8Nr+QyrG4/MuXMl1HWnlZtcZXVpzPrCWggtQpMD4QAhZZYBB+yMWWgdLl
	iRNw==
X-Received: by 10.14.218.132 with SMTP id k4mr50015156eep.27.1360585217107;
	Mon, 11 Feb 2013 04:20:17 -0800 (PST)
Received: from x34f ([95.15.76.43])
	by mx.google.com with ESMTPS id h5sm62205784eem.1.2013.02.11.04.20.15
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 04:20:16 -0800 (PST)
Date: Mon, 11 Feb 2013 14:20:13 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130211142013.7dec4c91@x34f>
In-Reply-To: <ly4nhkgtyt.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <cover.1360332752.git.pfalcon@users.sourceforge.net>
	<0d914f6415e72c6d9999b0f2f5b3e6c8ec209363.1360332752.git.pfalcon__32328.1499594033$1360345753$gmane$org@users.sourceforge.net>
	<ly4nhkgtyt.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] ccache.bbclass: Allow user to override CCACHE_DIR.
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
X-List-Received-Date: Mon, 11 Feb 2013 12:37:16 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Sun, 10 Feb 2013 14:48:58 +0100
Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:

> Paul Sokolovsky <pmiscml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> writes:
> 
> > For example, some users may want to use single cache directory
> > (instead of per-package) with known max size limit, to better
> > control disk usage.
> 
> You change conflicts with
> 
> | do_clean[cleandirs] += "${CCACHE_DIR}"

Good catch, thanks.

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


