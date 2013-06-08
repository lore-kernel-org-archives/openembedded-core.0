Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A7FF56A918
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2013 02:10:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r582AKrB023182
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Jun 2013 19:10:20 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Fri, 7 Jun 2013 19:10:18 -0700
Message-ID: <51B292AB.6040602@windriver.com>
Date: Sat, 8 Jun 2013 10:10:51 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1370585547.git.Qi.Chen@windriver.com>
	<4caf51c1d2225dc66aeef8326ba0616d97f7c691.1370585547.git.Qi.Chen@windriver.com>
	<CAP9ODKoSeooN+tpqVEvB5uEE2U7yyt5O1Jy1LZcPpyOYb7FV8A@mail.gmail.com>
In-Reply-To: <CAP9ODKoSeooN+tpqVEvB5uEE2U7yyt5O1Jy1LZcPpyOYb7FV8A@mail.gmail.com>
X-Originating-IP: [128.224.162.233]
Cc: qingtao.cao@windriver.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] busybox: remove the postinst part of the recipe
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
X-List-Received-Date: Sat, 08 Jun 2013 02:10:19 -0000
Content-Type: multipart/alternative;
	boundary="------------020502040607080907080500"

--------------020502040607080907080500
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/2013 08:32 PM, Otavio Salvador wrote:
>
>
>
> On Fri, Jun 7, 2013 at 3:13 AM, <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     From: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>
>     Remove the pkg_postinst_${PN} from this recipe, as it's redundant.
>     It basically wants to do the same thing as the update-alternatives
>     does. But it doesn't do it well.
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>
>
> Instead of removing it, please convert it here for update-alternatives 
> so it keeps working on this commit and allow bisect in future if need.
>
Hi Otavio,

Thanks for your review and comments.
Sorry but I don't understand it :(
What do you mean by "convert it for update-alternatives"?
Could you please give me a little more explanation?

Best Regards,
Chen Qi

> -- 
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br http://projetos.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


--------------020502040607080907080500
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 06/07/2013 08:32 PM, Otavio Salvador
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAP9ODKoSeooN+tpqVEvB5uEE2U7yyt5O1Jy1LZcPpyOYb7FV8A@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <br>
          <div class="gmail_quote">On Fri, Jun 7, 2013 at 3:13 AM, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">From:
              Chen Qi &lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
              <br>
              Remove the pkg_postinst_${PN} from this recipe, as it's
              redundant.<br>
              It basically wants to do the same thing as the
              update-alternatives<br>
              does. But it doesn't do it well.<br>
              <br>
              Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
            </blockquote>
            <div><br>
            </div>
            <div style="">Instead of removing it, please convert it here
              for update-alternatives so it keeps working on this commit
              and allow bisect in future if need.&nbsp;</div>
          </div>
          <div><br>
          </div>
        </div>
      </div>
    </blockquote>
    Hi Otavio,<br>
    <br>
    Thanks for your review and comments. <br>
    Sorry but I don't understand it :(<br>
    What do you mean by "convert it for update-alternatives"?<br>
    Could you please give me a little more explanation?<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CAP9ODKoSeooN+tpqVEvB5uEE2U7yyt5O1Jy1LZcPpyOYb7FV8A@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">-- <br>
          Otavio Salvador &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; O.S. Systems<br>
          <a moz-do-not-send="true" href="http://www.ossystems.com.br"
            target="_blank">http://www.ossystems.com.br</a> &nbsp; &nbsp; &nbsp; &nbsp;<a
            moz-do-not-send="true"
            href="http://projetos.ossystems.com.br" target="_blank">http://projetos.ossystems.com.br</a><br>
          Mobile: +55 (53) 9981-7854 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Mobile: +1 (347)
          903-9750<br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------020502040607080907080500--
