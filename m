Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TbUMZ-00014H-8N
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 11:50:31 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so680080pad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 02:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=4SyrwRRhSi0Er8/35C5mTMRexs3pkcBDfEixtCD6jPs=;
	b=pmD6QTkM1zwBDAErZMc8vLs6Vf9pp5nV6s5lyHDnGb4DN+T+4e/rsCF/23uewrIQ0/
	0sy+1vTZp/9CJJ3iOrpQOzNDNlWFQEu3h1OX6LLWGzRxX/adiNor3jC6jk5IrvSIwR5j
	BIqcTT5fzXRk02nI9zpTLROTiVHtnjxl8wu3O91Zj59yZL/9yiOAStqVBUqRrtKo6x/M
	vpUBEvMhn9zsQTrY7WZHMX06eeVx2IDet3rCajfmDqrX1O6gwh5faY4nNJkClPhDd10N
	24J74mUuPdv/VI3Wp491GoQMdv90hWsvE77dCBIyxKCdaKepVTdE64oAnPBVJSdNUYjH
	j1tA==
MIME-Version: 1.0
Received: by 10.68.213.33 with SMTP id np1mr3624588pbc.64.1353580584347; Thu,
	22 Nov 2012 02:36:24 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Thu, 22 Nov 2012 02:36:24 -0800 (PST)
In-Reply-To: <d6c10ffd234888a17125737771a32bd4203a30e0.1353553774.git.kai.kang@windriver.com>
References: <cover.1353553772.git.kai.kang@windriver.com>
	<d6c10ffd234888a17125737771a32bd4203a30e0.1353553774.git.kai.kang@windriver.com>
Date: Thu, 22 Nov 2012 08:36:24 -0200
X-Google-Sender-Auth: HLCefJOk6XfK_BInG6JHAzftIMY
Message-ID: <CAP9ODKpi7Trn0bnEY128M2pVaMojt7EvGn3KpdqdNLdkak1uqA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Kang Kai <kai.kang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] packagegroup-core-lsb: remove lsbsetup
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
X-List-Received-Date: Thu, 22 Nov 2012 10:50:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 22, 2012 at 1:25 AM, Kang Kai <kai.kang@windriver.com> wrote:
> package lsbsetup has been dropped, so remove it from packagegroup
> core-lsb.
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>

This needs to be done *before* removing the package.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


