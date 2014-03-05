Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id B74766E717
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 15:32:53 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id v1so1149462yhn.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Mar 2014 07:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=K1X/rDlDHT9Qyf3HLyih0sO4L2Wtb831khckwkjzrWg=;
	b=ba7tleJLCKRuEC4DGyEcxxrHFvgATYOBSTGJ0wmFTKanOa+P6KEQgbxEqFpnu5nzR9
	Dr1wcEdtbuQgtw7OlWRYYtsG/lrQ0GUa1Ph9Z1TBbetnaK/ZfUQiR78M3db2jNONOwZ3
	1NzjA8ejkE631s+bsQQO9vVyADNkZNnGJ+U7NxSxMPA7+oYT4gPKrND3Cfma7NmLDC0U
	WUEnz9Il5g52fba6a21C9hGTiBRVcFQ2F8Q1Hxjslh78HUIW5D4LlziPYASy1MeOZJL7
	NB3ixOKmKWLTmq+wouSxLh9aTxmlqywKIaPMiM+LZuv0AgMk89PvR15UjZCqE524lsga
	txSw==
MIME-Version: 1.0
X-Received: by 10.236.198.197 with SMTP id v45mr6284394yhn.87.1394033574264;
	Wed, 05 Mar 2014 07:32:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Wed, 5 Mar 2014 07:32:54 -0800 (PST)
In-Reply-To: <1394029227.31845.119.camel@ted>
References: <1394029227.31845.119.camel@ted>
Date: Wed, 5 Mar 2014 12:32:54 -0300
X-Google-Sender-Auth: MDVtb_TCSD254s9DjipSuwA0y4E
Message-ID: <CAP9ODKpVqoArvHTqJk=vEqY2i54BmNq1x4ASNa+noTxEWEDBzQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Deprecate the PRINC logic
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
X-List-Received-Date: Wed, 05 Mar 2014 15:32:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 5, 2014 at 11:20 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The PRINC logic is now deprecated, the PR server should be used to handle
> the automatic incrementing of the PR (package release) field.  Add a warning
> message to alert users to the change. The functionality will be removed
> in the next release cycle.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

