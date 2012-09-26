Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TGs2h-0001M9-A9
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 15:52:47 +0200
Received: by iebc13 with SMTP id c13so1313615ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 06:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=YbKsJkMauUAecJfvp2Nrb7fG/FNiFLW+2CVFU1+T6W8=;
	b=APC/Mj0ZuLXiIghmL8gaynXfmvM5/XgBzTp9dQcn6wgbvAjNvoRnz43F1aJQNGpAHk
	iXMJ91lJxF7rvhTf3G1+RT7kIahVeuD9je98ICIgKEITsxRoCyvolUFixHbgjPDUvrjW
	+FSgc16bAN5glOcENey9q64tJDYIrtLmjfzkeWXdo2N8+DDO0wJVZY0d1+9OfZPXZQ82
	qwXx6Gv4r9aBa7yOGBqXAfPu3HFp8VN05Pj8PCUjgmUDkStY3k4G756GFpTmLOnazSCt
	FbujtOHCMppgocJLxApy5SIrBrgWz6xa3OBEORxgOvvnsbVhEiTrLFbjbM0/yEFNO2+w
	VpCA==
MIME-Version: 1.0
Received: by 10.50.236.6 with SMTP id uq6mr465713igc.50.1348666795295; Wed, 26
	Sep 2012 06:39:55 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Wed, 26 Sep 2012 06:39:55 -0700 (PDT)
In-Reply-To: <1348662532.31293.111.camel@phil-desktop>
References: <1348661505.31293.106.camel@phil-desktop>
	<20120926122357.GJ3313@jama.jama.net>
	<1348662532.31293.111.camel@phil-desktop>
Date: Wed, 26 Sep 2012 15:39:55 +0200
Message-ID: <CALbNGRQS7+-RBWUwc6qFguADhsWeGOin6q6=JrHy5W=Xcb7C_A@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdk-pixbuf: Use qemu to run postinsts in offline root mode
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
X-List-Received-Date: Wed, 26 Sep 2012 13:52:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 26, 2012 at 2:28 PM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2012-09-26 at 14:23 +0200, Martin Jansa wrote:
>> On Wed, Sep 26, 2012 at 01:11:44PM +0100, Phil Blundell wrote:
>> > This makes it possible to use gdk-pixbuf on a read-only rootfs.
>>
>> Isn't this issue resolved in "[RFC 0/7] Postinstall improvements" too?
Investigations are still pending since I saw unexplainable effects on
my standard image.

Andreas


