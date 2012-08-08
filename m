Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sz5Ej-0002p0-2v
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 14:19:41 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 08 Aug 2012 05:07:52 -0700
Received: by obbuo19 with SMTP id uo19so908934obb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 05:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=OiB+bkLE263CvxtXea3Ib19lHhi7tIiu0OgYGIjrv/E=;
	b=NnbOkjWXXb3tHuOgwA5eoHt5Xt/mw5jgPcpypv0hd0SvflFVF546nZBro3lZVZkZBq
	iYC03gnh/iqAZk6eRCU8H9toMmktMQUm+33k2ctan5tuGIV0TQ95MDjCLvUArCFJK9yV
	Q7Gxd8ECtBPilyUPi58vD70j2PtAN52S1Kld0OGbtLWDs/qi58ZYMKbuulYaRlel4xvN
	WtAGOosqfD33o/kqBAgIBL/y8SU5GJA4hzO+lJRpUzxUpmsJMSxXREP4fegszNqDbxWz
	ZNb92e8TnUe23xh8HD9zkAmYCKvEklj/OrQ9Rnux5UOFYb0vDWtzEMXNj1FJ398vAA99
	2f+g==
Received: by 10.182.51.37 with SMTP id h5mr29944795obo.35.1344427671575; Wed,
	08 Aug 2012 05:07:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.45.10 with HTTP; Wed, 8 Aug 2012 05:07:31 -0700 (PDT)
In-Reply-To: <1344422390.23275.233.camel@phil-desktop>
References: <CAJTo0LZn3md_x3a9-+LV67FYopkXaPgFv8-+U4JEj7UzwSYd9Q@mail.gmail.com>
	<1344422390.23275.233.camel@phil-desktop>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Aug 2012 13:07:31 +0100
Message-ID: <CAJTo0Laqeyr4AeKdZ5Fw5BQiDGdZPJNcm8VZZvWR9ZqjbjnaUw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkzOcsoA7Ot/3DmM98maviaVbOvBPZOsY8HzmwcTNe6K8cGF46FgkVWwBlJsVRsfAlxPXVy
Subject: Re: Replacing Web in Sato with Midori
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
X-List-Received-Date: Wed, 08 Aug 2012 12:19:41 -0000
Content-Type: text/plain; charset=UTF-8

On 8 August 2012 11:39, Phil Blundell <philb@gnu.org> wrote:
> So in the longer term I continue to feel that
> Sato should probably go away into its own layer (or, at least, a layer
> that isn't oe-core) and oe-core itself should gain a dedicated test
> suite.

So what would your ideal dedicated test suite for anything visual (X,
input drivers, video decode, display outputs, etc) be?  I acknowledge
that webkit is a pretty huge dependency so was planning on conceding
that by making it optional, but my plans around Shuku as a Sato
replacement mainly involve removing packages, the only addition being
Midori because it's pretty tough these days to deny that a competent
web browser/HTML app engine is becoming an important feature as many
appliances are moving to HTML/JS instead of other languages (kiosks,
STBs, etc).

Ross


