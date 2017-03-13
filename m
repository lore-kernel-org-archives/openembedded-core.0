Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 666CD776B9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 08:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2D8OGWG022025; Mon, 13 Mar 2017 08:24:16 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8CBWY5nBdyNT; Mon, 13 Mar 2017 08:24:16 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2D8OD2B022020
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 13 Mar 2017 08:24:14 GMT
Message-ID: <1489393453.13980.28.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 13 Mar 2017 08:24:13 +0000
In-Reply-To: <4ae06894c190997f459b4d50aa09d5011b80fb7f.1489391139.git.liezhi.yang@windriver.com>
References: <cover.1489391139.git.liezhi.yang@windriver.com>
	<4ae06894c190997f459b4d50aa09d5011b80fb7f.1489391139.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] devshell.bbclass: add editors for devshell
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
X-List-Received-Date: Mon, 13 Mar 2017 08:24:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-03-13 at 00:46 -0700, Robert Yang wrote:
> * The vi, vim, emacs and nano can be used in devshell.
> 
> * The groups, lesspipe and dircolors are required by
> /etc/skel/.bashrc on
>   Ubuntu 14.04, otherwise, there would be warnings when start
> devshell:
>     bash: groups: command not found
>     bash: lesspipe: command not found
>     bash: dircolors: command not found
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/devshell.bbclass | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/classes/devshell.bbclass
> b/meta/classes/devshell.bbclass
> index 4de7ea6fce..055d21ba50 100644
> --- a/meta/classes/devshell.bbclass
> +++ b/meta/classes/devshell.bbclass
> @@ -2,6 +2,12 @@ inherit terminal
>  
>  DEVSHELL = "${SHELL}"
>  
> +# Tools used in devshell
> +HOSTTOOLS_NONFATAL += "vi vim emacs nano"

Thinking about this further, I think we need to restore PATH for the
devshell. We can't really go down the road of trying to add in links
for any tool the developer may want to use...

Cheers,

Richard

