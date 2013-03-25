Received: from mail-la0-f41.google.com ([209.85.215.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UK6wz-0004mM-UR
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 13:56:38 +0100
Received: by mail-la0-f41.google.com with SMTP id fo12so11244410lab.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 05:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=XZIumHiI3nsuw28uw9XqYA289jYgQqhtLCQLoZa4PL8=;
	b=d/tj3DkK6jEX8OW6pbsYTqkK8pkyfGb8W7ECrlJ0HjXhSSbuvrZfIpney54sFmy3NH
	aLDeberyv5Jc4I+gj1tkOBPmEjY8RExfwaBHt3P6nagzLbbQAUe4/D7pbP8gyDR6fIhy
	uMH93JIoB562X68vqnynD99jD7rngBdjfTQ9Vmnk1TU8Wxys2nDchfNpzrpvNgWKETCH
	EtEiwRU8dLNO8SPxCRLYvC8v328xP/0mfFDXhPdSPM/5DgdyX04Oc3/WaAfbxFjwvU0U
	YotJQ+rwL9ywBycWLYWi7PaCZqFc6eplaMzOCl3tzxn8P6MaUxEiT20P3SzKbN/ZRnFX
	cDgw==
X-Received: by 10.112.150.101 with SMTP id uh5mr2976195lbb.92.1364215175364;
	Mon, 25 Mar 2013 05:39:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.81.231 with HTTP; Mon, 25 Mar 2013 05:39:15 -0700 (PDT)
In-Reply-To: <20130322220037.GW3219@jama>
References: <cover.1363973088.git.ross.burton@intel.com>
	<20130322220037.GW3219@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Mar 2013 12:39:15 +0000
Message-ID: <CAJTo0LbpOM6ZfBxQ-jOwWW91nMHDe6rFbpQBNXHNtkj-aXsgMA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlsTxmfmgvQ37ig8xaFlv0MWacVb/9jUeEe6DQ3yeZSvgkE39NPmlhGhsb07iaCUW9WQpxD
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] [PATCH 00/22] hybrid systemd/sysvinit, and systemd fixes
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
X-List-Received-Date: Mon, 25 Mar 2013 12:57:01 -0000
Content-Type: text/plain; charset=UTF-8

On 22 March 2013 22:00, Martin Jansa <martin.jansa@gmail.com> wrote:
> Do you have one for oe-core?

Whoops, forgot to split it out that one commit.

ross/systemd just touches oe-core files now.

Ross


