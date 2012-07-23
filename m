Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1StF41-00065z-4Q
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 11:36:29 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 23 Jul 2012 02:25:01 -0700
Received: by yhpp61 with SMTP id p61so4756287yhp.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 02:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=3cMqpD4Jk0tNDgYoi2RKe84ZbltyRmUvM88jZha3lzo=;
	b=cTMCcYwpxPoT93oVaVrPwkKnNFHnTuJOZI3+9HsWc2kkyDub02anb53KvNL+4JRARC
	t3GqOv931aEjFz/EdvOsj1FY1dnt2+ZGv0YvEST/x0N3T5wrI+laBC2tLhEHwadhRv+o
	QkMabIPi2NA8K62ZAkMhg2Fthbo3vXgM52qUq2/jMy6rEhzJ1hpDpeUlQ1m6/atFGUsJ
	YZZeYLVvymncqPsQ+8hvz/O1pcUQk/byCqwN2NvOTNCtdmivSNHlUDfVjEkiqOhJxD7t
	15WX6TKbx5szXwd7MmTqIWzZAaa3L+KbDaPn01Of1aXgE5MCT+UuX56j6yzWIwHWPVUz
	/yKA==
Received: by 10.50.207.36 with SMTP id lt4mr10026248igc.5.1343035500582; Mon,
	23 Jul 2012 02:25:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Mon, 23 Jul 2012 02:24:40 -0700 (PDT)
In-Reply-To: <20120723091809.GC3271@jama.jama.net>
References: <20120722104320.C057610218@opal>
	<20120723081543.GA3271@jama.jama.net>
	<CAJTo0LYK43FiO-iJ3wQf3Dsid14ckSkW9cAGhKtBUV8sDACd2Q@mail.gmail.com>
	<20120723091809.GC3271@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Jul 2012 10:24:40 +0100
Message-ID: <CAJTo0LbeGyWVP-fLUYrM1w_UK6QDm7aby-jfKO8R6bW-XhbskQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQm7AihR0YagaG7K31H4MEtsng4l3uMSp+h2vkV1UQQTLvQVVXi0oHkKhmZdSDDxEfbMKThD
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : Add gtk-doc-stub
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
X-List-Received-Date: Mon, 23 Jul 2012 09:36:29 -0000
Content-Type: text/plain; charset=UTF-8

On 23 July 2012 10:18, Martin Jansa <martin.jansa@gmail.com> wrote:
> For some reason non-native gtk-doc-stub is pulled to image dependency
> tree for me after last oe-core changes. I'll check dep graph.. if that's
> not expected.

No, it's not expected.

Ross


