Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 272C873956
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 16:42:13 +0000 (UTC)
Received: by yhoc41 with SMTP id c41so19860088yho.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 09:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=wvBxoqfDk0JI9PatRkmtaeKHAKZED75GibkNcIBt92w=;
	b=L47bASXwuXlUTFMWHrZLXnn4U7+0HSPsj1hMaimM5KwACl5BBxHGLe0/BHVOiF3Xxf
	dDSOJfQDG36/XQsmRugpp1c4SfrwHevdA5axVs+AEcRWms5rPfpiJua3YOpEtf/E4oQu
	hoAPiFwx4RMBz6VpCGcwImqTdQYZFiAzV5Wp7MOv6x4mwNCVcJiKKzjNWv1C4nzpjjLU
	UGVegm2Mqw42Xj3rNaIfH6bGkbKGhpx8CrvHeLPZIxZsz/Bd2ujzlia4YcLK/NFozQjL
	QWjVPXvQBMmhUlp7uQ1EJzP8/oxmHCDV5O/EpK6DxdoJjIPvOjjK/KfQ5GKoizgwjFzG
	1LyQ==
MIME-Version: 1.0
X-Received: by 10.236.210.5 with SMTP id t5mr27180700yho.104.1425919334398;
	Mon, 09 Mar 2015 09:42:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.71 with HTTP; Mon, 9 Mar 2015 09:42:14 -0700 (PDT)
In-Reply-To: <1425919096-19919-1-git-send-email-ross.burton@intel.com>
References: <1425919096-19919-1-git-send-email-ross.burton@intel.com>
Date: Mon, 9 Mar 2015 13:42:14 -0300
X-Google-Sender-Auth: Wp-CpGlhH9NNwqUEf961V10OxwM
Message-ID: <CAP9ODKpbN_n-hHqN6iVzkfCf6282y3os757=q2SxpdAeDxyc8A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] liberation-fonts: inherit allarch as fonts are arch-independent
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
X-List-Received-Date: Mon, 09 Mar 2015 16:42:16 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 9, 2015 at 1:38 PM, Ross Burton <ross.burton@intel.com> wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Once this is merged, please backport it to Dizzy as well


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

