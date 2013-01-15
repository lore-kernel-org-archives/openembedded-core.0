Received: from mail-oa0-f49.google.com ([209.85.219.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TvDAH-0008P5-Eq
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 21:31:33 +0100
Received: by mail-oa0-f49.google.com with SMTP id l10so595012oag.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 12:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ErDBvezy6xOeifgMZ/o0Df39aMxKlq8FY8jPOzfAWJU=;
	b=LsxT5sbtCQBha1d8oaLRroNPithMpdY87Lstv9aA6Tk6lVFjY2adJ6h9UtivrpeDwC
	nnWiCnY9eG4QJ+WRhyqtCHWUezEOqZ2KcbTKsswAdTbntGi6qI49HtoOUO3enMxcWTgk
	XnD95ure7ESDrwIunmTFjUOOx29LpMysAk2g7iV7fSMlOoRzgWFqCuHlB+Qw5nbppUWF
	9jUAr8lPWTSxBR0hk8Y42WyUrvg0uEZ108P9bcN3e7D364Q6qz/rAvjlzz1zOMJQWYNW
	oi4BmjIIC5t8yLyQMyr/V+4S5ZqhOY7zYdygV1px/DMvQo31vS2TmZy0KEYCErDow0Xh
	Yfuw==
MIME-Version: 1.0
Received: by 10.60.171.11 with SMTP id aq11mr55528288oec.104.1358280958990;
	Tue, 15 Jan 2013 12:15:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Tue, 15 Jan 2013 12:15:58 -0800 (PST)
In-Reply-To: <1358280527-14078-3-git-send-email-cristian.iorga@intel.com>
References: <1358280527-14078-1-git-send-email-cristian.iorga@intel.com>
	<1358280527-14078-3-git-send-email-cristian.iorga@intel.com>
Date: Tue, 15 Jan 2013 18:15:58 -0200
X-Google-Sender-Auth: hfoPGf7rH-6-aZlzOB4g1SirGX8
Message-ID: <CAP9ODKpNzcW7qtqC5WX7EP6OZBLBpKPLn_S1zsguZkcjgvz3Kw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Cristian Iorga <cristian.iorga@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4 2/3] connman-conf: configures connman in qemu machines
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
X-List-Received-Date: Tue, 15 Jan 2013 20:31:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 15, 2013 at 6:08 PM, Cristian Iorga
<cristian.iorga@intel.com> wrote:
> For qemu machines, connman should not configure
> virtual wired interfaces. Wired interfaces (eth0)
> are assigned static IP addresses by the virtual machine
> manager (qemu). This packages places the eth0 interface in
> a list of blacklisted interfaces, forbiding connman
> administering wired interfaces for qemu machines.
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>

I think this will raise a warning durig build for non-qemu machines, no?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


