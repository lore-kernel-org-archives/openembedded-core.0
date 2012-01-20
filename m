Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RoI6N-00055J-0X
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2012 18:18:11 +0100
Received: by qan41 with SMTP id 41so550588qan.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2012 09:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=x8O+lZcnR49LmbNJHy4LIQCTQ7brEV3jb+33Qx0bKW4=;
	b=NbgoPkVCdU4qfEkdUCvOsggiR+/xbWJI3voJAz1AjcrTTgxRzwBdbsWQ/QbeTTS8k6
	C5xPGIzdx+qj+mmeRIIpsoRAkni87GKGBVul/15dVcFmiA+wK4jAVDkYPvRWoB0sQOvg
	HTiorXEnefIGrRDmV9EH++zGBPaAcUDPvBT9I=
Received: by 10.224.97.135 with SMTP id l7mr24331637qan.54.1327079429710; Fri,
	20 Jan 2012 09:10:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.235.211 with HTTP; Fri, 20 Jan 2012 09:10:08 -0800 (PST)
In-Reply-To: <CAMKF1sqGt0FTbnhpuP9HCeJ6LpqJrRs8GVB6azdPGfcvYHSJSQ@mail.gmail.com>
References: <CAMKF1sqGt0FTbnhpuP9HCeJ6LpqJrRs8GVB6azdPGfcvYHSJSQ@mail.gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Fri, 20 Jan 2012 10:10:08 -0700
Message-ID: <CABcZANn5zbXFwTuXwL2GM1FknKrY1OjBfDv=TTyH1=NRrqqDKw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: adding tools-debug to EXTRA_IMAGE_FEATURES pulls other tasks from same recipe
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
X-List-Received-Date: Fri, 20 Jan 2012 17:18:11 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 19, 2012 at 11:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
> I added to local.conf
> EXTRA_IMAGE_FEATURES += "tools-debug"
>
> and now when I do bitbake -g I see that its wanting to build
> "tools-testapp" and "tools-profile"
> even though I did not ask them to be added to my image. all these
> packages are coming from
> single recipe task-core-tools.bb. If I divide this recipe into 3
> different recipes where each provides
> just one task, it then leaves the others out.
>
> Since these are meta packages they pull in a lot of stuff. Would it be
> ok to divide this recipe
> into 3 individual recipes ? Ideally I would expect that the other
> packages dont get build even
> though they are in same recipe but that is not the case at present


One option would be to avoid the task indirection and simply set
PACKAGE_GROUP_tools-debug = "<list of debug tools>"
-- 
Christopher Larson


