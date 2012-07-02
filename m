Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SlqTm-0007hA-Rq
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 01:56:30 +0200
Received: by eekd49 with SMTP id d49so2300466eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2012 16:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=y+yW1DC3+Kbuj+P10Uc/aePnxWJrcUjc7yFXU9hT4II=;
	b=OGymZ90Oz4DJFBIQuuI+YlegLnDulcKON4iQsYkdgWqUGTdlTQ5Xaiza9eCa0FyNnz
	rvS/zdokSHpLK5E039gjbPwefPnHTZvV8mqzA2KMXfCmgYwqwBnxTX1BQIST7qCP6jIp
	9yS44nKSg5MLJdUUUW5qSPvjyPDj+ZhOk+EvLeV02OZzg0vH5Uft2ryqookdj46v1ZYu
	8mkhOGSCX4nFvizDgEpQfAzNLE4xOE81ZrJZiMtPBJmT9bI63IBMjZEIFEIljvUsMxjG
	cVdLoFnlPvlpnjU5hDyNzfe7KFIpf6k+0w9wFhFlNObxRyzNzTmHngjBWMhOdyfRDkyu
	dH6Q==
Received: by 10.14.185.137 with SMTP id u9mr3902792eem.220.1341272729714; Mon,
	02 Jul 2012 16:45:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Mon, 2 Jul 2012 16:44:59 -0700 (PDT)
In-Reply-To: <1341259602.2886.27.camel@x121e.pbcl.net>
References: <cover.1341257063.git.mark.hatle@windriver.com>
	<ce879400de83074f4c24961787ec36aad372fb80.1341257063.git.mark.hatle@windriver.com>
	<1341259602.2886.27.camel@x121e.pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Jul 2012 16:44:59 -0700
Message-ID: <CAMKF1sp2RfBJEggBUzkR9xdQ9L5Q_ik3Za2hCFf=3cJDCkqrEg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oprofile: Change /root to /home/root
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
X-List-Received-Date: Mon, 02 Jul 2012 23:56:31 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 2, 2012 at 1:06 PM, Phil Blundell <philb@gnu.org> wrote:
>
> Why is it putting "daemon setup information" in /root in the first
> place?  Surely that should go in /etc or some such place.
>
> Also, the choice of where root's home directory goes is a distro
> decision and, in the general case, it is not correct to say that "OE
> uses /home/root".  Changing the hardcoded value from one thing to
> another is probably not that much of an improvement overall.

yes having ROOTHOME configurable is desirable but probably nothing as such
exists AFAICT


