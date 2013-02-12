Received: from mail-oa0-f52.google.com ([209.85.219.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>)
	id 1U5NqG-0005AX-9L; Tue, 12 Feb 2013 22:56:46 +0100
Received: by mail-oa0-f52.google.com with SMTP id k14so593505oag.39
	for <multiple recipients>; Tue, 12 Feb 2013 13:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=2P2JksWGPwzeCY8JKJxg+TivmsA+XMEoOydGMYTaSC4=;
	b=zitpgFTQHHn0lw2COYFg+va3Iih83RXpzeD6DKrmTv6Tnv885U0gS7QltzMzgwo7Bf
	u9LTYuaTdzGEDmUh/tiZmj5ZrxAUmzMb2eRJQ+CIlcvHfYNnHviqE8KD95BS5L1e1Fpf
	gLfLY4jtLiXCZIiItihedAHzxSOI/Zjh05dqqRkFyC8vFsau9x5IJdfw4JgJfVqsx4gY
	s2ZIelYkz9eYNhsJflV8r4+cR/PX5GL654dPgiDCoUkmzJo+aJaVWW+AzCCsNjFWVU11
	VNXdZ0dNHRa4cfhwjVc2An8S8Yvr9HH52WKMApJDJs9GwJanSkHSVUunfVOPmOjY9Shd
	fx2A==
MIME-Version: 1.0
X-Received: by 10.60.169.135 with SMTP id ae7mr14387914oec.82.1360705243786;
	Tue, 12 Feb 2013 13:40:43 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Tue, 12 Feb 2013 13:40:43 -0800 (PST)
In-Reply-To: <CAJTo0LZREeVX7cWLttEvzxSK_VMNPQyZuQqReEMTH-zbHObdLw@mail.gmail.com>
References: <2760168.9kFd94gL1F@helios>
	<CAJTo0LaJNDB6XjK0M4rsS9+z7AZ6K_n0TAX8+7KH2GuAADgCZw@mail.gmail.com>
	<1906630.s5um26QAQj@helios>
	<CAP9ODKrOM9bh-MnzQvU29iVwYdRvw4m7DMYZUcMV=wKYJ5Q4bg@mail.gmail.com>
	<CAJTo0LYFcT5P=p62Nn2kBak33LCfBXQ_KFL-oF2bHFKhguk1rg@mail.gmail.com>
	<20130212212255.GF3300@jama>
	<CAJTo0LZREeVX7cWLttEvzxSK_VMNPQyZuQqReEMTH-zbHObdLw@mail.gmail.com>
Date: Tue, 12 Feb 2013 19:40:43 -0200
X-Google-Sender-Auth: ZgNCs41wzQugf2vt4IVzyBgE-6A
Message-ID: <CAP9ODKp5ugCq=unrxdmzdrgvRYZKb=mKqRFc=44+tBkCd78vHQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Martin Jansa <martin.jansa@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] RFC: meta-oe appends and overlayed recipes
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
X-List-Received-Date: Tue, 12 Feb 2013 21:56:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 12, 2013 at 7:36 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 12 February 2013 21:22, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Yes, xf86-input-tslib works
>> http://git.openembedded.org/meta-openembedded/commit/?id=506d5f781f5ee93e3c9b8ca51a7fb65f40d4a8b8
>
> [ surprised face ]
>
> You totally should push those tarballs to a git repo on fd.o,
> pengutronix has clearly abandoned it.
>
> In a harsh mood (its 2130 and I'm working) I'm leaning towards making
> tslib a packageconfig for qte, and moving tslib into meta-oe...

Not if qte does not support evdev; this needs to be checked first or
it'll be a regression.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


