Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UUZ1Z-0003CE-Kb
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 10:56:31 +0200
Received: by mail-vc0-f180.google.com with SMTP id m17so350102vca.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 01:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=bwiYY44S39AYUga7ilWe3i8KcXDsozwWy5oIGRT6vek=;
	b=czRBFck0gOmwJG0pD01/cjKui/ACt77JTnXnf6CLomFtYTsmhMF0LVAMAhsXozWTSk
	ChGAkUEbUrvnm3v2reJHdSKMFQ5dv5/DQsgPMZsgBht5MhKbAloj9U1PUQqyoUklT0JO
	PExrdYDYjD+euS++RTeZ2DSBesNmqj4upN8mLzQApD2ydvqaW/i2Uy+a3Hn56N6suBcj
	sOy8cD3+HKxZHMlAHx2fMmhRJBWk12Ldi5u1SzUxkvNjnIBKUyb/Y6TFMaXGo+pBf639
	RV5vtnMI7pB6jqt9ldXSGZ55CTr1VPqqEoV2slxYLGXjg8xC2oQlgcH+gReDJ1rEZhVk
	JTNQ==
X-Received: by 10.220.147.79 with SMTP id k15mr7535681vcv.38.1366706329105;
	Tue, 23 Apr 2013 01:38:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 23 Apr 2013 01:38:29 -0700 (PDT)
In-Reply-To: <CANyK_8daiW+Mn9LQLh72hgqPjW-HOYMMKR68fB=A2k-gT42gUw@mail.gmail.com>
References: <CANyK_8daiW+Mn9LQLh72hgqPjW-HOYMMKR68fB=A2k-gT42gUw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Apr 2013 09:38:29 +0100
Message-ID: <CAJTo0LYOs1f5oTDQJY23YQmgJ=E5mUAYNquRkOg=+6ehqsaFVg@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
X-Gm-Message-State: ALoCoQlHRBpe+SdDEEJj+IomEauzL5bPGeiplXI3zdRERnBYzkunl7PrVULhR/09mtq2GNjq9gUh
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: AGPL-3.0
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
X-List-Received-Date: Tue, 23 Apr 2013 08:56:33 -0000
Content-Type: text/plain; charset=UTF-8

On 23 April 2013 09:28, Paul Barker <paul@paulbarker.me.uk> wrote:
> I noticed that the copy of AGPL-3.0 in common-licenses
> (http://git.openembedded.org/openembedded-core/tree/meta/files/common-licenses/AGPL-3.0)
> just contains the string "license exceeds allowable cell character
> limit". Is this intentional or should it be replaced with the full
> license text? If so I can send in a patch to fix this.

Yeah, that's a bug.  Presumably some tool broke when exporting the
licenses.  Patches welcome!

Ross


