Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2AE166B19D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 14:25:09 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id k14so4266437oag.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 07:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=jVmzCqeXUdUgEmJ4Tdv5YOI4XuS31NkE75ax1YFtDsw=;
	b=SXNFpYhHCCVPl2EHIUo6yncDbY74q9DkRTItc37DYnaIZ4CdWwTVOII9hAhSpOQafv
	WHS0xk/cKVxxHgb4QyeVjK9kk9zrVb8bL5ShwustMmByR0+Zc/97uMIn5XqAyIN57FaB
	0F40MVIQizuSz2oyMs0DRJZfvKayijpJOdzxYBGg6E74k+qtPdA2DEaBnnIofydsiJfm
	hu6MBVpqOsoK9oK4F/mPZpwhMXwW86oLDQwqGpUA3JS5GvYjqjpZybtMCRNUnbF0fCNH
	SMjdw46zjk8SgaUQKQRT3hRTOSCGWzRa800LH0yqGfsXoOPhuwfZGbSoxZx089rjTkv0
	1UbQ==
MIME-Version: 1.0
X-Received: by 10.182.205.138 with SMTP id lg10mr7754849obc.6.1374157509794;
	Thu, 18 Jul 2013 07:25:09 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Thu, 18 Jul 2013 07:25:09 -0700 (PDT)
In-Reply-To: <a6f5cb59348a434d4b03599b69f101cd0d5177fe.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
	<a6f5cb59348a434d4b03599b69f101cd0d5177fe.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
Date: Thu, 18 Jul 2013 11:25:09 -0300
X-Google-Sender-Auth: O7bHkoplwz7HjLrBJbbx7ssst64
Message-ID: <CAP9ODKop8KSgS93MAPvFPQx+i6m9QVbeeYk+5CVdCVO-MoO38w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] rt-tests: add PV variable into recipe
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
X-List-Received-Date: Thu, 18 Jul 2013 14:25:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 18, 2013 at 11:16 AM, Emilia Ciobanu
<emilia.maria.silvia.ciobanu@intel.com> wrote:
> Git packages should include git token inside the PV variable.
>
> Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>

I agree with the fix but it'd be better if you made it  clear you're
including Git revision into PV; the PV variable addition is just a
consequence, not the goal.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

