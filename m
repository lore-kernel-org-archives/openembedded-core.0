Received: from mail-vc0-f172.google.com ([209.85.220.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1UUZ9t-0004jN-7q
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 11:05:06 +0200
Received: by mail-vc0-f172.google.com with SMTP id hx10so350694vcb.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 01:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=alnSuBZ5yVyvrr86DbDf7S32D1rk81V5bAf/ZL3jdHY=;
	b=GM6CE3CD7hd2ZNPcsQ+SBG1YXdR2OvA+keLNYbdSlFBYa3QGZV2yEoRGa3EVqatu0Q
	JOwrt3cgtXbqZzSGXGrwmk248UMAy8zJm5JP+LctyGFcFwUEBAHdxGuOSG/aTUBOyK/5
	rV6LJgRqT3rajKA7qbeavBhym0Kr5CyHI/u9FBDO1kG2ASMKqMo3EdWOJso2KxW30Rbq
	uJEqXAwq75Orzq/yogjL2TUqc0wUcHhedqT/J8C42QHWSsrupO3ZyZubLl0yYvlcL1Pp
	6XFu8WGbcBXPqi455YYJkXXqGDOCDJsR1Ut+GeenCy+jj6QFb0QfJU1OvQGwbKT0Tpqc
	VZJw==
MIME-Version: 1.0
X-Received: by 10.220.245.4 with SMTP id ls4mr21497693vcb.17.1366706844756;
	Tue, 23 Apr 2013 01:47:24 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.220.224.135 with HTTP; Tue, 23 Apr 2013 01:47:24 -0700 (PDT)
In-Reply-To: <CAJTo0LYOs1f5oTDQJY23YQmgJ=E5mUAYNquRkOg=+6ehqsaFVg@mail.gmail.com>
References: <CANyK_8daiW+Mn9LQLh72hgqPjW-HOYMMKR68fB=A2k-gT42gUw@mail.gmail.com>
	<CAJTo0LYOs1f5oTDQJY23YQmgJ=E5mUAYNquRkOg=+6ehqsaFVg@mail.gmail.com>
Date: Tue, 23 Apr 2013 09:47:24 +0100
X-Google-Sender-Auth: BzS9OBGshqcgd4veed-nCV-MCRA
Message-ID: <CANyK_8eqqb0SF9BkavGXvcMzTuX1WWf+2MzoKN+AL0Whf0R8Xg@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Tue, 23 Apr 2013 09:05:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 23 April 2013 09:38, Burton, Ross <ross.burton@intel.com> wrote:
> On 23 April 2013 09:28, Paul Barker <paul@paulbarker.me.uk> wrote:
> Yeah, that's a bug.  Presumably some tool broke when exporting the
> licenses.  Patches welcome!
>

I noticed a couple of HTML-isms in OFL-1.1 (when diffing against the
license of a package to be sure that it was the same license text)
such as '&amp;' instead of just '&' and '&#8212;' instead of '--'. Do
these want fixing as well?

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


