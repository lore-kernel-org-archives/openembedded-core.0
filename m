Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7B21D77DB5;
	Mon,  8 Jan 2018 21:57:49 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id j4so6493693pgp.1;
	Mon, 08 Jan 2018 13:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=FY1ylrHv2ztXpm+1QX601X+DUw3EewlEFHRqalA+UgM=;
	b=iSFlCwVdBxiZXZmaHlaOyFfUoFKEY+njZvaElzphj5XHiXk5ZrfMB1rF4v3oHWmPua
	LCe84xMk00dnYR6eK2+gFl+brYDiLehHY1VsGlag7zDpV11xkPNHIf6MpgCXWJywPT/A
	4W3L6oikgJ2PylEVQ8GMJFM8rhHwsjm7zlosxOxsRsuxaItcqFfrEA+LXt9KmuxmHJ96
	txTEUQ7lcKRpXNsu3sATKJPS3aCvX66MLdd+MiFdeGH63MsDhX0Y1XeaAHwKIxjDmW/D
	cnmT43N1H9j2xZgFic2yP1Rn6pKbaDFkLvtjK5/cQpWd+82kCH8TUZBH7FclBKb4qkuZ
	1htQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=FY1ylrHv2ztXpm+1QX601X+DUw3EewlEFHRqalA+UgM=;
	b=p5q/fE03pXkRxCVXcVse7H8yHBMVTpgOqWXyo6dJ7wAiuMj43UOkk6BZrb4xsugFCa
	pCsjkmgOME1iBfT+Q7Pryo7ErgdYyQCmw+en3BXsaYgQKshruJG0uUi0EtxKpugNsvMX
	HFarkmxv74zxi+6urOZVCbnrjPNzWKbQ7n9llO49iaJ58cjOE9qzbdmZe/B36iLASkgL
	4zXdJzGNbs3HHRXvW0mn4o6sayuc4kuGyCpb146PiVXObVigStkV+m6pqeGZ9/qe2I6q
	R29FCpWdx9pH3FaNfJlPkYPt9iUejXSrcc4YtT117ySSzTOq2wDuJqntX1o5yqx4cdiQ
	m6wA==
X-Gm-Message-State: AKGB3mI9vhhSxYZoCqAzuClNynUfmWbaQLt0q/RZRhRuuqzMU/kW2aI2
	t7mdfu+cYBBNZGxv1iw6W1POhA==
X-Google-Smtp-Source: ACJfBotToObBCx60UUfIC+RUOforkeHMKlUEXqs7xl7mv5eTGmE4qDJOjmwlDjvbqxeTBhU8N+tzeA==
X-Received: by 10.124.25.19 with SMTP id c19mr6557245plz.402.1515448670539;
	Mon, 08 Jan 2018 13:57:50 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:9491:79df:6f19:2655?
	([2601:202:4000:1184:9491:79df:6f19:2655])
	by smtp.gmail.com with ESMTPSA id
	v186sm4030026pfb.5.2018.01.08.13.57.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 13:57:49 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <161986bc-e04c-3cdd-c744-5cebff1d4fb7@gmail.com>
	<CADkTA4M_b8e3d3bRCE+jY44F_atCy6ej51wdVEmFKE5y12nKVA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <90d7f4e2-5b44-34ad-6403-d843e244299b@gmail.com>
Date: Mon, 8 Jan 2018 13:57:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4M_b8e3d3bRCE+jY44F_atCy6ej51wdVEmFKE5y12nKVA@mail.gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Yocto vrs K.O kernel, wireguard go Boom
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
X-List-Received-Date: Mon, 08 Jan 2018 21:57:49 -0000
Content-Type: multipart/alternative;
	boundary="------------BE909E8BD3071B3F20407177"
Content-Language: en-US

--------------BE909E8BD3071B3F20407177
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 01/08/2018 08:01 AM, Bruce Ashfield wrote:
>
>
> On Mon, Jan 8, 2018 at 10:08 AM, akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     Hello,
>
>     Wireguard in meta-networking is failing do to compat.h issues on
>     newer kernels. I have updated the package and it fixed  my problem
>     on 4.14 K.O kernel. Now I build it with the Yocko 4.12 and it
>     fails. It wont fail with a 4.12 K.O kernel. The is one commit that
>     was backported from 4.13 K.O to yocto 4.12 which is causing the issue.
>
>     random: add get_random_{bytes,u32,u64,int,long,once}_wait family
>
>
>     	6e4990d8d226e1861a5a2b632cf93bc70feab3af
>     <http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.12/commit/include/linux/random.h?h=standard/base&id=6e4990d8d226e1861a5a2b632cf93bc70feab3af>
>
>
>
>
>     	
>
>
> If you try the 4.9 kernel, does it also have issues ? Either way, it
> is likely just a -stable
> fix that hasn't made it into our 4.12 maintenance cycle yet, and that
> is something we
> can fix by adding anything that is required to get things building again.
>
> But knowing the 4.9 status would be a good data point, since I have
> more -stable 
> updates queued (and not sent).
4.9 works fine with current wireguard and updated version.

- armin
> So if it blows up, and then doesn't with AUTOREV,
> we have a small set of commits to look at.
>
> Bruce
>  
>
>
>      I know Yocto is maintaining the 4.12 beyond the K.O release
>     process so I don't know if this a kernel bug or if I need to come
>     up with some other solution.
>
>
>     regards,
>     Armin
>
>
>
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"


--------------BE909E8BD3071B3F20407177
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 01/08/2018 08:01 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4M_b8e3d3bRCE+jY44F_atCy6ej51wdVEmFKE5y12nKVA@mail.gmail.com">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Mon, Jan 8, 2018 at 10:08 AM,
            akuster808 <span dir="ltr">&lt;<a
                href="mailto:akuster808@gmail.com" target="_blank"
                moz-do-not-send="true">akuster808@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div text="#000000" bgcolor="#FFFFFF">
                <p>Hello,</p>
                <p>Wireguard in meta-networking is failing do to
                  compat.h issues on newer kernels. I have updated the
                  package and it fixed  my problem on 4.14 K.O kernel.
                  Now I build it with the Yocko 4.12 and it fails. It
                  wont fail with a 4.12 K.O kernel. The is one commit
                  that was backported from 4.13 K.O to yocto 4.12 which
                  is causing the issue.<br>
                </p>
                <p>random: add get_random_{bytes,u32,u64,int,<wbr>long,once}_wait
                  family</p>
                <table summary="commit info"
                  class="m_-8118685174776223369commit-info">
                  <tbody>
                    <tr>
                      <th><br>
                      </th>
                      <td colspan="2" class="m_-8118685174776223369sha1"><a
href="http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.12/commit/include/linux/random.h?h=standard/base&amp;id=6e4990d8d226e1861a5a2b632cf93bc70feab3af"
                          target="_blank" moz-do-not-send="true">6e4990d8d226e1861a5a2b632cf93b<wbr>c70feab3af</a></td>
                    </tr>
                  </tbody>
                </table>
                <br>
                <table summary="commit info"
                  class="m_-8118685174776223369commit-info">
                  <tbody>
                    <tr>
                      <th><br>
                      </th>
                      <td colspan="2" class="m_-8118685174776223369sha1"><br>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>If you try the 4.9 kernel, does it also have issues ?
              Either way, it is likely just a -stable</div>
            <div>fix that hasn't made it into our 4.12 maintenance cycle
              yet, and that is something we</div>
            <div>can fix by adding anything that is required to get
              things building again.</div>
            <div><br>
            </div>
            <div>But knowing the 4.9 status would be a good data point,
              since I have more -stable </div>
            <div>updates queued (and not sent). </div>
          </div>
        </div>
      </div>
    </blockquote>
    4.9 works fine with current wireguard and updated version.<br>
    <br>
    - armin<br>
    <blockquote type="cite"
cite="mid:CADkTA4M_b8e3d3bRCE+jY44F_atCy6ej51wdVEmFKE5y12nKVA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>So if it blows up, and then doesn't with AUTOREV,</div>
            <div>we have a small set of commits to look at.</div>
            <div><br>
            </div>
            <div>Bruce</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div text="#000000" bgcolor="#FFFFFF"> <br>
                 I know Yocto is maintaining the 4.12 beyond the K.O
                release process so I don't know if this a kernel bug or
                if I need to come up with some other solution.<br>
                <br>
                <br>
                regards,<br>
                Armin<br>
                <br>
                <br>
                <br>
              </div>
              <br>
              --<br>
              ______________________________<wbr>_________________<br>
              Openembedded-core mailing list<br>
              <a href="mailto:Openembedded-core@lists.openembedded.org"
                moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
              <a
                href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              <br>
            </blockquote>
          </div>
          <br>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          <div class="gmail_signature" data-smartmail="gmail_signature">"Thou
            shalt not follow the NULL pointer, for chaos and madness
            await thee at its end"</div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------BE909E8BD3071B3F20407177--
