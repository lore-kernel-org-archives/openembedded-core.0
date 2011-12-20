Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rco5K-0005gH-3J
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 02:01:38 +0100
Received: by lami14 with SMTP id i14so2338194lam.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 16:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=RPdZrSlQpBHs0TFtBVvo+rvK/A2wBnbT2e3j5WwRMAM=;
	b=rGCvrxosth+4wZ+RKlE5n/DuOii+4E7mH7yMGa5lFlkP8b8yd9uvFCG8JQpS5fVsfV
	OemYmUZM3T31PAXsl5OLgq7qEoVAs9tTpoP2FhmJxCi6rQZivcVHi7J9yrn9tJmsRWO5
	e5xroPO6GW4PMkeA5ReTiauWbdX8Q0IIrEzB0=
Received: by 10.152.128.103 with SMTP id nn7mr18026649lab.48.1324342474595;
	Mon, 19 Dec 2011 16:54:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.36.198 with HTTP; Mon, 19 Dec 2011 16:54:03 -0800 (PST)
In-Reply-To: <1324297631-11187-1-git-send-email-b19537@freescale.com>
References: <1324297631-11187-1-git-send-email-b19537@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Dec 2011 16:54:03 -0800
Message-ID: <CAMKF1so+P9PfwA4BwdQewXKAbbfH9Hw1H=du_vzQN+G29ty6AQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH oe-core v2] valgrind: remove COMPATIBLE_HOST to extend the supported arch
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
X-List-Received-Date: Tue, 20 Dec 2011 01:01:38 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 19, 2011 at 4:27 AM,  <b19537@freescale.com> wrote:
>
> -COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
> -

and did you test it on the newly enabled ones. e.g. mips ?
does it work for you on mips


