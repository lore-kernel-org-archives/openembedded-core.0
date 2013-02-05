Received: from mail-ia0-f170.google.com ([209.85.210.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U2mOX-0006l6-2e
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 18:33:27 +0100
Received: by mail-ia0-f170.google.com with SMTP id k20so410078iak.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 09:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=k/I3zTyXt//8LzVyrbJuDmWkDz6MRm52JwE/jRW5pDA=;
	b=UVKwcTtmzC4+zVUxg+GCRWWg8XOhxo+EEd1jVccMTfTQ99klfqIhFd4RCDJABoaY7T
	2pV5y0GTjW3vevhr4HHgKTsfOYj7dcOp3C60mDwFTDkChHpno/k+02dl51eeqrl6jXc+
	F9WTHrtVJiu6aakUl719rWyQXoolffOF+VY8C6igvivK5WjFMHTC7TX4rI7o4OgCOjgF
	SrFIrQ0ISDhZ8bsd6XtUoxZ30a7jYTkMyT9SG5BES7i2N9ctaFxMcYFgOBF3XlcgpbOq
	IrP85FqGM0vrhpnqVaj+K8Bi9jNI38Y2Qbx2iW0GZbm7rol8jepvWErE+zYEhN/cqrQw
	WjWg==
MIME-Version: 1.0
X-Received: by 10.50.11.229 with SMTP id t5mr111950igb.65.1360084647703; Tue,
	05 Feb 2013 09:17:27 -0800 (PST)
Received: by 10.64.143.228 with HTTP; Tue, 5 Feb 2013 09:17:27 -0800 (PST)
In-Reply-To: <CAJTo0LZh=XEoK7DYJqNy8OCthYMRd=+5gLjPMR3Aj8DX6R-76Q@mail.gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
	<3666e39a359b03ba1e054813f4353ddeed11d506.1360079373.git.rep.dot.nop@gmail.com>
	<CAJTo0LYDkCvZUCp4U4o_2bsmuiVor69Wbh4Rd94g3WvQ4=X5Yw@mail.gmail.com>
	<CAC1BbcQss0BHe_CGx+H_QKbASNS-_4Bad8rHeCNdJERg-G8Y4w@mail.gmail.com>
	<CAJTo0LZh=XEoK7DYJqNy8OCthYMRd=+5gLjPMR3Aj8DX6R-76Q@mail.gmail.com>
Date: Tue, 5 Feb 2013 18:17:27 +0100
Message-ID: <CAC1BbcSpM5nGnH0QBQYOWEjuPVHpvEWR4uxBsErqx4h9n=-3yw@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] Revert "Add ptest for glib."
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
X-List-Received-Date: Tue, 05 Feb 2013 17:33:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 5 February 2013 17:59, Burton, Ross <ross.burton@intel.com> wrote:
> On 5 February 2013 16:47, Bernhard Reutner-Fischer
> <rep.dot.nop@gmail.com> wrote:
>> I do not have time to look into this, sorry. But yes, of course fixing
>> it for real would be better..
>
> Sharing the log of the failure would help immensely.

The uncompressed log is about 50MB, i put it here (still 1.2MB):
http://busybox.net/~aldot/oe/mk.all.20130118-1442.53.log.xz


