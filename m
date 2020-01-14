Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 138317FA19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 22:37:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 00EMbp87013242
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 14 Jan 2020 14:37:51 -0800 (PST)
Received: from [172.25.44.8] (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 14 Jan 2020 14:37:50 -0800
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20200114193010.92629-1-Oleg.Polyakov@windriver.com>
	<13AD08C4-930D-479F-81E7-3B6405C3BD94@gmail.com>
	<e0a7cf43-7d0b-5318-22de-9009d702061f@windriver.com>
	<CANNYZj83UugdN=aNFncqFRF304YxBtYLgd6b4bP-Na_bLvMvwA@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <700a9b55-e817-64ad-ac01-843a125ec8f7@windriver.com>
Date: Tue, 14 Jan 2020 17:37:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CANNYZj83UugdN=aNFncqFRF304YxBtYLgd6b4bP-Na_bLvMvwA@mail.gmail.com>
X-Originating-IP: [172.25.44.8]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vim: update from 8.1.1518 to 8.2.0110
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
X-List-Received-Date: Tue, 14 Jan 2020 22:37:52 -0000
Content-Type: multipart/alternative;
	boundary="------------F7E8F97B6CB249BE51FB2AF9"
Content-Language: en-CA

--------------F7E8F97B6CB249BE51FB2AF9
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 1/14/20 5:18 PM, Alexander Kanavin wrote:
> On Tue, 14 Jan 2020 at 21:10, Randy MacLeod 
> <randy.macleod@windriver.com <mailto:randy.macleod@windriver.com>> wrote:
>
>     Oleg is getting started using Yocto so I'll reply on his behalf since
>     I asked him to update vim as his first commit.
>
>     I'm not sure what you mean by 8.2. Are you talking about calling
>     the recipe:
>     vim_8.2.bb <http://vim_8.2.bb>
>     instead of vim_8.2.0110.bb <http://vim_8.2.0110.bb>?
>
>     Vim tags on a daily or more frequent basis. Are you saying that we
>     should keep the
>     same SRCREV for 8.2.0110 but use a different name?
>
>     I looked at:
>         git log v8.2.0000..v8.2.0118
>     and all the commits seem to fix bugs so I prefer to take this tested
>     v8.2.0110
>     update and update vim every month or two so that we get the latest
>     fixes.
>
>
> Vim adds a tag for every single commit they make, fixes or not, so 
> this approach would in effect be updating to random development 
> snapshots. I would rather have a more conservative update strategy, 
> and update to the original 8.2 release. If you look at the homepage, 
> 8.2 is the version they announced as the new release: https://www.vim.org/


Sure, that's fine for now. Most of the commits are bug fixes after 8.2 
but we don't need to
worry about any of them now and I guess if we stick with this approach, 
and say there as
a CVE for vim that we wanted to fix, we'd just backport the single 
commit rather than
bump the version to 8.2.1248 or some such version.

>
> That's also what 'devtool latest-version vim' should currently report 
> and 'devtool upgrade' upgrade to: I purposely cut off the point 
> releases and left only the major.minor part there.

Right. This will also give Oleg an excuse to try 'devtool upgrade' to 
compare manually upgrading. :)

../Randy


>
> Alex


-- 
# Randy MacLeod
# Wind River Linux


--------------F7E8F97B6CB249BE51FB2AF9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 1/14/20 5:18 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj83UugdN=aNFncqFRF304YxBtYLgd6b4bP-Na_bLvMvwA@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">On Tue, 14 Jan 2020 at 21:10, Randy MacLeod &lt;<a
            href="mailto:randy.macleod@windriver.com"
            moz-do-not-send="true">randy.macleod@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Oleg is getting started
            using Yocto so I'll reply on his behalf since<br>
            I asked him to update vim as his first commit.<br>
            <br>
            I'm not sure what you mean by 8.2. Are you talking about
            calling the recipe:<br>
                <a href="http://vim_8.2.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">vim_8.2.bb</a><br>
            instead of <a href="http://vim_8.2.0110.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">vim_8.2.0110.bb</a>?<br>
            <br>
            Vim tags on a daily or more frequent basis. Are you saying
            that we <br>
            should keep the<br>
            same SRCREV for 8.2.0110 but use a different name?<br>
            <br>
            I looked at:<br>
                git log v8.2.0000..v8.2.0118<br>
            and all the commits seem to fix bugs so I prefer to take
            this tested <br>
            v8.2.0110<br>
            update and update vim every month or two so that we get the
            latest fixes.<br>
          </blockquote>
          <div><br>
          </div>
          <div>Vim adds a tag for every single commit they make, fixes
            or not, so this approach would in effect be updating to
            random development snapshots. I would rather have a more
            conservative update strategy, and update to the original 8.2
            release. If you look at the homepage, 8.2 is the version
            they announced as the new release: <a
              href="https://www.vim.org/" moz-do-not-send="true">https://www.vim.org/</a></div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Sure, that's fine for now. Most of the commits are bug fixes
      after 8.2 but we don't need to<br>
      worry about any of them now and I guess if we stick with this
      approach, and say there as<br>
      a CVE for vim that we wanted to fix, we'd just backport the single
      commit rather than<br>
      bump the version to 8.2.1248 or some such version.<br>
    </p>
    <blockquote type="cite"
cite="mid:CANNYZj83UugdN=aNFncqFRF304YxBtYLgd6b4bP-Na_bLvMvwA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>That's also what 'devtool latest-version vim' should
            currently report and 'devtool upgrade' upgrade to: I
            purposely cut off the point releases and left only the
            major.minor part there.<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Right. This will also give Oleg an excuse to try 'devtool
      upgrade' to compare manually upgrading. :)</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CANNYZj83UugdN=aNFncqFRF304YxBtYLgd6b4bP-Na_bLvMvwA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>Alex<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux
</pre>
  </body>
</html>

--------------F7E8F97B6CB249BE51FB2AF9--
