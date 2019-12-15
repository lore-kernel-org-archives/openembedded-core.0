Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CD0077F7C2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 17:11:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47bWCw2ZyBzJv;
	Sun, 15 Dec 2019 18:11:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1576429916;
	bh=vypRlr8DChUZ7v6AVWeZAoBL7RgyRdk6sFRXnGT1DtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iPAw22ghnsybsCxT2bdXrkNFafsVJizshPGQRqLGHVHE6IxcyYMNdVOMy/JqJ+rA0
	QqLfwqqLNjREzPltuLNv6VRor1qjQYgRCKhAg/d3ahXd9JiIJx4/dwrnoi8Pk/OpYx
	gBZUnxhj2ITwE1z/+lRKj4Cfg5xORq31Zj1ukMpSJNdiUR8MNNSM3ND5fWE2izN/Yf
	Va4qP+QLO4+4ZYPO9GFKAae1RDeUUOR12x1AKkWa7cJHPoxDUcgXZyHH99GD+kh9CT
	3S1n4IETUGknG6rsmvciWAm9EqkODk3WRZhCh/kgB7BMOG9HXdjePzEU5hJUZp+iuQ
	8sbNt1nDGd6+FbcDGmY3yc4bOJK+9KItd99uh/5a69aYs14q4Bu3LTecjfs6UE+yZo
	VYNpiKVYbThin6V4pHNp3KTQC8476QrO9VcYvBXWXTH1Ih/fW2VJgOYLS4TbmVfs6j
	l+2+p3FdaQHHA4HeNEbAq4HM0MhC0bcG3N+qQ1CYMUdHAkSwWakyCFKZdBf0ow8OWT
	S2UOkE3cJ2s9BBmLuzTHm1LdupkJM4uzXnrmQJ8bARb8tjXa3TrPte01jTvZ7xxxU7
	YjuqH1JwKwi8MkzUJOb3c0vFT3DDVf0veSHugEnPscQtaHPG8EXeaezAiZU47x3Jtz
	1JiVHzac4e5+6eb7thLRpqWU=
Date: Sun, 15 Dec 2019 19:11:52 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Carlos Rafael Giani <crg7475@mailbox.org>
Message-ID: <20191215171152.GA14038@localhost>
References: <20191215124910.24946-1-crg7475@mailbox.org>
MIME-Version: 1.0
In-Reply-To: <20191215124910.24946-1-crg7475@mailbox.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [WIP][PATCH 01/12] gstreamer: Add common .inc files for meson based recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Dec 2019 17:11:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Dec 15, 2019 at 01:48:59PM +0100, Carlos Rafael Giani wrote:
> * gstreamer1.0-plugins-common.inc
>   The old gstreamer1.0-plugins.inc file, adapted for meson
> * gstreamer1.0-plugins-packaging.inc
>   The old gst-plugins-package.inc file, adapted for meson
> * gstreamer1.0-ptest.inc
>   Common code for meson based PTest support; autogenerates the run-ptest
>   file and is designed to use the gnome-desktop-testing suite runner
>   (which is why the .inc files inherits from ptest-gnome)
>...

Should these become classes, so that recipes in other layers can used 
them easily?

cu
Adrian

