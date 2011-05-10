Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QJrDv-0007aW-98
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 19:59:55 +0200
Received: by vws2 with SMTP id 2so819251vws.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 10:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type;
	bh=JBZdgQFCiF0O1yCHu0zzsxpzQ/OgjmohXoo5Imoj1xc=;
	b=nN+n4DWa5SkOeMhBlDyYG0seABo7sn7K0CrIlzKllsSOGbfgFuPkoWrusyZB/l5jcT
	rD0CwVxKMi3pbhhnbT4O/wo2abf/CRtPPAUWtZtByfvPdyGlwYhRDVQ6MKYvJVLSxd4L
	qCYUqeQZ5eMng+1R9pmX//rPOSFmworjo/dhU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=ql9JfTnrLqjkoZViAeN3exnVpUDolfocGIVTJrYbUC+hIH7hfIGkFtvf6Km57vkQN8
	VbTLeaT4NfUkiikpmgmlGg4wsTpMaYpLq4u8j/AM7XHMBxiq7q/QG+WyWFjDaNM8eclI
	TiDPD+55KBS5Hp9KMPaNpFrLjnlwMDHilAyyE=
Received: by 10.52.77.3 with SMTP id o3mr2826159vdw.101.1305050226094; Tue, 10
	May 2011 10:57:06 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.114.233 with HTTP; Tue, 10 May 2011 10:56:46 -0700 (PDT)
In-Reply-To: <1305017649.30391.255.camel@rex>
References: <cover.1305004776.git.sgw@linux.intel.com>
	<491cfc546a2843493cf466c1e1af11ec8ac2dcee.1305004776.git.sgw@linux.intel.com>
	<1305017649.30391.255.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 10 May 2011 10:56:46 -0700
X-Google-Sender-Auth: iRTAd4QyeGInj5GnCIv8q2u7ivU
Message-ID: <BANLkTi=46eCWm2KQVHgr-z_Kdo7iChPuyQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/30] conf/layer.conf: Use .= to append to BBPATH and =+ for BBFILES
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
X-List-Received-Date: Tue, 10 May 2011 17:59:55 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 10, 2011 at 1:54 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Er, how about we actually fix metadata_scm.bbclass instead of making the
> world more complicated and fragile? :)
>
> I suspect metadata_scm could use the COREBASE variable and be much nicer
> code...

I'd really like to see it gather information about the current state
of all layers which are scm working copies and summarize this in the
build summary, rather than grabbing one specific bit of information,
personally.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


