Received: from mail-ve0-f170.google.com ([209.85.128.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UbtvI-00062m-Ix
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 16:40:25 +0200
Received: by mail-ve0-f170.google.com with SMTP id 14so1790867vea.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 07:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=NIAvHfcGjUzWU4ZhT/y345yX+GDF7QLmvL0lCw8+k/4=;
	b=FKdY8/rl8ywl5iNVp4dELgJ6Camh8z35W0swurgV3Y16MoP1AZGHQ6GtzOeIhBCBdR
	WYmhNeAXb5n59oDxhu9aXyGve70VISe4dZm/ynoDsM8TT8zGgWyjlrv4I8ACoOYJWyjD
	o0dOVcADdxJKDby5Mrh+/hDHUvlGiHkQS8Dx10MwKd9DYRV+f9dZz+wmAaq2+N/v6Wt7
	Od7ItO8o5HP9UqHWvgbfXFvfbqKUoohhrp0iexSax5p/psFrsxF7eWB9PuX0Vn2tgOzQ
	90X+6aV/mZVIanfgOZ9pkpVs1UkZVn80cppcatP9QDW88DdPQMcFAy77GTC9ou+wZLqV
	7vLw==
X-Received: by 10.52.37.196 with SMTP id a4mr15917920vdk.82.1368454930526;
	Mon, 13 May 2013 07:22:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Mon, 13 May 2013 07:21:50 -0700 (PDT)
In-Reply-To: <5190CE8C.703@gmail.com>
References: <1368413938-7757-1-git-send-email-net147@gmail.com>
	<CAJTo0LaFExB-DxJCJ-Sranagpbxc56sT9ahBwgtBLH0PVq3_9g@mail.gmail.com>
	<-7685674658700664845@unknownmsgid>
	<CAJTo0LaVF+sV6JxpaxfL2_daoP+y1CQe=-VqWbTFW+ZVNA8i5Q@mail.gmail.com>
	<5190CE8C.703@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 May 2013 15:21:50 +0100
Message-ID: <CAJTo0LZeDaucw4PGP8JjaJEJemyiYbf+2-eUim9Nfj-cuWj-DQ@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQlfSx6+C5KVM/0dRCIgIAIUO2XykzyFom2wS03eelk6cJnJ0TYmn6/RrTwVdlxdDlJTC4sD
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] connman: add iptables to RDEPENDS
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
X-List-Received-Date: Mon, 13 May 2013 14:40:41 -0000
Content-Type: text/plain; charset=UTF-8

On 13 May 2013 12:29, Jonathan Liu <net147@gmail.com> wrote:
> The connmand daemon was complaining about libxtables.so.9 missing, but it's
> libxtables.so.10 now.
> Maybe I just had to force a more complete rebuild.

iptables upgrading should have caused connman to rebuild against the
new iptables and pick up the new dependency, so it's possible that
your machine is pending a connman upgrade if you've been using a feed
to upgrade.  If it's a fresh image, then something went rather wrong.

Ross


