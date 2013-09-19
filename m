Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id D18846158D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 17:29:54 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id wm4so10534907obc.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 10:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ol9XxuXn1HxqQomnD9rqIH64auq/a26uflA5jNTb+oo=;
	b=o7LTaSlG8F1BgRLfYYEtAJLKtH6OhNwUydwBeAPcOvSac+bNti90fRzf4yzzymiQhk
	IprbWDquN/yzLIgD/jzqjEeFK+ZhX8iEiALyKT6dZPpOkd8qYJ5aQwz/03T42qik+mur
	BkiD+guU5knaz5Xs7Fs5QseX6e89gwkJ25mI1K0PWRpB+knZvpTbbleol8+oe2xiQfEz
	exZVXuHqb3DIxmFkF4U+2wnZw/UKCcs6LsVMgMMwWBu7nxS7CwY4jiBN1yZqZZHr5x0C
	NfsWSCL7UYCJhLT0z1eZ13oB+hdqz43BaMF4A3s/Aj4/PDBx8GicXe/el52JlquPldrw
	92fw==
MIME-Version: 1.0
X-Received: by 10.60.155.166 with SMTP id vx6mr2105585oeb.28.1379611795928;
	Thu, 19 Sep 2013 10:29:55 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 19 Sep 2013 10:29:55 -0700 (PDT)
In-Reply-To: <552A140193B5B04F9B5027CA06300D85C47CD6@44c-mariner.eurogiciel.fr>
References: <552A140193B5B04F9B5027CA06300D85C47CD6@44c-mariner.eurogiciel.fr>
Date: Thu, 19 Sep 2013 14:29:55 -0300
X-Google-Sender-Auth: QbqpfBsQtsON5NCPHTw1S0mTTKU
Message-ID: <CAP9ODKr8LsbuFvfWcCJonpHvMa82EWH95mtLjW5x75-R2B2BCw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
Cc: yocto <yocto@yoctoproject.org>,
	"poky@yoctoproject.org" <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Building a Poky distribution based on Wayland/Weston 1.2
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
X-List-Received-Date: Thu, 19 Sep 2013 17:29:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 19, 2013 at 11:48 AM, Ewan LE BIDEAU-CANEVET
<Ewan.LEBIDEAU-CANEVET@eurogiciel.fr> wrote:
> Hello,
>
>
> I'm currently trying to have a poky distribution with Wayland/Weston 1.2 and
> no X server at all. I think I have successfully ported Wayland/Weston to 1.2
> version and disabled the X server, so here is my questions :
>
>
> 1) Does this project interest you ?

I am interested on this.

> 2) How can I test if Wayland  has been correctly built ?
>
> Currently, the Weston shell is up and running.

\m/

> 3) Knowing I started my project from Poky and Open-Embedded repositories, on
> which upstream repository can I deliver my work ?

I'd start a layer in github to host this work until 1.6 is open for this.

> I added a poky distro configuration that seems to be delivered into Yocto
> git , is it correct?

Works fine I think.

> About the changes around Weston & Wayland, the new bb files should be
> delivered in YOCTO or OpenEmbedded project?

A layer for interim work.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

