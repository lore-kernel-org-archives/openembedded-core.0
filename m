Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJOA9-00084N-IF
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 14:34:53 +0200
Received: by pbbro12 with SMTP id ro12so9965170pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 05:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=0o7DIZ6VHA4LV93X+/939MqkiUNojxFDhYKZlB8EdrA=;
	b=Mw+/Mz5qAMGiW+Qos/MFhqCyBoJ821TkC2FtumySAn2jXLFALQD6v2njec0PYTIXYM
	a2p+rC0T8EDkkr3MAlbeoZhEHA1q/Yk6gS7DCsjdeVrR/7xK264ETXYsAI6li1/GggSM
	WMJlkK2pfSe7f63x820moeAK4oJzW5SPul81TCAkEptlC7rksD3fF0H/+Tg9JrehVFaZ
	tZsdUtZyfs1I+bFmP9RCiwMsUwgcUPg7tiYM8ORAVWwj1Ip9Y2CSbLyLHCZO0xYdLxp4
	F6WztlngSuL0p1RSW6ZNcLTnIT7/R+TWMtZ4zt6AWxYIzcFGInhRE8MWNWBUwsUaQinh
	ggOw==
MIME-Version: 1.0
Received: by 10.68.224.161 with SMTP id rd1mr12746937pbc.49.1349266913295;
	Wed, 03 Oct 2012 05:21:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Wed, 3 Oct 2012 05:21:53 -0700 (PDT)
In-Reply-To: <31141073add21ef176638e48bff752832901bb78.1349218820.git.elizabeth.flanagan@intel.com>
References: <cover.1349218820.git.elizabeth.flanagan@intel.com>
	<31141073add21ef176638e48bff752832901bb78.1349218820.git.elizabeth.flanagan@intel.com>
Date: Wed, 3 Oct 2012 09:21:53 -0300
X-Google-Sender-Auth: 7L-AHwbqKI5VbccQQtBpl_ZjSgQ
Message-ID: <CAP9ODKqUq_z4v6pVnhT2R9jv2oYm3=bj5CNfbrGwrFXHG+-udg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] bzip2 and busybox: Incorrect LICENSE
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
X-List-Received-Date: Wed, 03 Oct 2012 12:34:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Tue, Oct 2, 2012 at 8:01 PM, Elizabeth Flanagan
<elizabeth.flanagan@intel.com> wrote:
> The license for bzip2 is not quite BSD. I have an email out to the
> maintainer to see if we can utilize a common BSD license (or something
> else) however, for now, we should revert bzip2 back to a special
> license.
>
> As busybox also utilizes a lightly modified bzip2, this also
> effects busybox.
>
> Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

Please send it for denzil-next as well.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


