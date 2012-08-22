Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T4Cqu-00054E-FK
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 17:28:16 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 22 Aug 2012 08:16:10 -0700
Received: by obceq6 with SMTP id eq6so1311207obc.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 08:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=15dsZuag1mFEozRdgwJrY+pgbyLJEZzvgz/QlyH+tE4=;
	b=ECXNgoEvTHFsonXBbi2cXHOHsG4IZDQs2I4+3U+hArlPBM3ukgLbZsArRkNh8t4O0H
	oUfdnvzYhCBlHRWMoAjTcWbGAKerCsngpp5LrPHU0gRonDrjz7oK0xgRMMRzDX7Xwui2
	0rb7w0gtqIjS3p309bg3XJG91kOicWRscQMUuuJmfMwWS9nn+yTRYbUxGooo/DZJ7eL9
	l0g3t8j6gcpGf/OLECQCj/D7kiP7/qKqyAzMuYHs+DAhk0p2KYUoc4ZddqEXWhZUz7fu
	Lic3RlzKreMZJ7yRZqSYW5jXaYqkFo4GLTpErP41gtMxFSYP6O8sv7S+SW//Sce4MGBA
	FPiA==
Received: by 10.182.50.68 with SMTP id a4mr16170901obo.59.1345648569346; Wed,
	22 Aug 2012 08:16:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Wed, 22 Aug 2012 08:15:47 -0700 (PDT)
In-Reply-To: <CAJTo0LZpSd6LB+9W2kUcxfeU4GOVO5VOnLHMbHYT+1W6iVzcBQ@mail.gmail.com>
References: <CAJTo0LZpSd6LB+9W2kUcxfeU4GOVO5VOnLHMbHYT+1W6iVzcBQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Aug 2012 16:15:47 +0100
Message-ID: <CAJTo0LarhQSinwUHXuruO-OiCBOw4j89ko2n4RvctREApS5NZA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlOJ+DPiygiNd7okR/ZM9QHQtF+yXcjEW47mFcfRLDR2d2WJxG3/uSaUmI2/bRuoN5ubgZ/
Subject: Re: RFC: One X Server To Rule Them All
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
X-List-Received-Date: Wed, 22 Aug 2012 15:28:16 -0000
Content-Type: text/plain; charset=UTF-8

On 17 August 2012 13:12, Burton, Ross <ross.burton@intel.com> wrote:
> 1) Investigate differences between xorg/xorg-lite/kdrive, producing a
> feature matrix and binary size comparison

Some rough numbers: a core-image-sato rootfs for RouterStation Pro
using kdrive is 25959477 bytes.  Change kdrive to Xorg (Xfbdev and a
few important modules) and it grows to 26342094 bytes, approximately
380kb growth.

It appears that we're also shipping libexa in the core server package,
when I think that can be split into a separate package as fbdev isn't
using it.  That will give us another 90kb back.

I'm happy with this size increase as a trade-off for using an X server
that is actually maintained.

Ross


