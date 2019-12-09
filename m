Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D28C37F81A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 14:42:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47WmBQ3smFz3H;
	Mon,  9 Dec 2019 15:42:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575902558;
	bh=BuI5sYXMuShN7Nt9+BRs+yCRuVWgmwMyafoYLDoEH3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=akFy9l6sb4lu/JvShcWQQMTcG3ShH8d5yaTlnTvDGkcRUHvuI845OIHVISSQK6Dkq
	eIwFyzMsuRTXqwL+AxGtkOzYNAKgxWrguhiDG0RbGYi+mlPNT6igIKhOmQF2OcJZ3/
	K7nuYqb1tBM2/PjtVTmeK6FfoTrgZmHQS8IyFOqVdEKSGbnOmlwfp45wj3KTp5J8Gj
	6hvEnPc1e8FIAEIf4XsodTW8hyCL/0aSPGKcxjHRvzEAWtAh6W/3KmRftJiziLggDj
	W7xwT//uew10/L9bIe0T0ofNVyWEats/6j96fpoff6LoPg4KPcpBLi+0DNcKr8PuOK
	Y5/OV3sjZekcXfY2b05qeUPedqOkqe+wLv7NPg0tFC9U7CglDM7RnHO6HVNB9K6tB1
	ZiQAeHpI4vyIdylekhlBLfzUIIhffyn8gOp4sGEtmtKn6VbZLwSic7RCBHEKnPNcvI
	N2rLhk9jPANQaEOYdhcVOFV50N/iiko0cPsmtKucNmZZASAFNtwZ2xthAmoNSTJDjr
	GJjnca60BPReAHnCttbb3vvJ/qdhQ5lpMfWxm8y/keWmy0ovNIimWxJk/INVMLqsl8
	o98vyrUJMHLyz41G2x1nzaHH+bZVcZo6aBx1g0KIvUyQnqYBJx2pdiu+Lxmx56EGYS
	APbiA7wwQgrVVZiwavMhCJhQ=
Date: Mon, 9 Dec 2019 16:42:35 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20191209144235.GA5701@localhost>
References: <20191205212338.26696-1-bunk@stusta.de>
	<d710a6b0-a785-f8ab-48c9-0f2cb284ec58@intel.com>
MIME-Version: 1.0
In-Reply-To: <d710a6b0-a785-f8ab-48c9-0f2cb284ec58@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Upgrade 243 -> 243.2
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
X-List-Received-Date: Mon, 09 Dec 2019 14:42:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Dec 09, 2019 at 10:41:13AM +0000, Ross Burton wrote:
> On 05/12/2019 21:23, Adrian Bunk wrote:
> > +PV_append = ".2"
> 
> Why not just rename the recipe?

Laziness struck when seeing that these were 3 recipes...

I'll send a followup commit with this changed.

> Ross

cu
Adrian

