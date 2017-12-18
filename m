Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f45.google.com (mail-pl0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0519C77BD2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 17:11:29 +0000 (UTC)
Received: by mail-pl0-f45.google.com with SMTP id s10so5180269plj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 09:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=0O7qk0aPkxtITdK+uXxoDM7270GcwDOR2Tnn9RD4f+k=;
	b=AIsQo0WZZpP9rxUlYespzC+x6r7+/SUmkjpnr+//v9s+ZIcZttNY37MT5j9XpLuGtB
	HQOqP+EQ2rICD9XFeHmokrAf9bYe3bL8TcdH31mYjWvxlr/wfeIrN1PPkhPYHooCvo5L
	CkBPdJH+ez1+k2aG1UMrtKTxbGxafh9SCCZjH1c61/rJJeGUfbeNMSh4OGi/+QWwOWs9
	TrWXIudPxO3t1UeDtn/5X9qxsIvHqOmPwGCcd6ZZvgMwr2sJkEFu9VsjNcE1iAklHove
	c4Pu5H4+Srz/E2+ES8c5GCOiQYqoVZ798fn4EFk+Q+LAkf+t+9GlBNmgTsWZ7OBGfjaW
	0XUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=0O7qk0aPkxtITdK+uXxoDM7270GcwDOR2Tnn9RD4f+k=;
	b=rJ7cQxerJMnr/nSYgwdx9HqlMPgCwqn3eh46+ePFtPPY35hIATmTYaL5U+xlqMzSk7
	jxVmWM8IuFs0ePhCouodKF17/CSAZ07EFIu7zwCXzjPH5u2ulpkpqb+HULYUGaCuyJSk
	lOIYmus//ju81QrbHi47wFFjzWzzhIbnxwrgwdE05hSI3UWEGRs7jFZpLV03jfxNmpPs
	KNvKId3r2nJhg7hwClPrRUIX2psaNxRcfmvzSWqpyvNhQ2qbF6FKo3X/ez2VW9DZBUNZ
	8aSrsdK7nyJhnkuzMWqfp8UnF610lUzMXvwrq/ubM/9mgAlMDwXa4acCcqVOSJKZaqXW
	y3YA==
X-Gm-Message-State: AKGB3mK5eT0shRN5VHeCv+JZs3umQ0WhfSAIkbkhnnPk4GcstaPu+p0y
	O/lV3Yy7SWAMHJYakW1r+f7s5g==
X-Google-Smtp-Source: ACJfBotL3vyI0PwmRcDxAIbLITQydHi8In+Syw7cNFIpri2jRnY8BlXMwRlrHYGFNjMMT4IWQcvNGw==
X-Received: by 10.159.241.133 with SMTP id s5mr405514plr.40.1513617090861;
	Mon, 18 Dec 2017 09:11:30 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:e55e:48fe:ac14:e30f?
	([2601:202:4000:1184:e55e:48fe:ac14:e30f])
	by smtp.gmail.com with ESMTPSA id
	b20sm22757174pgn.91.2017.12.18.09.11.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Dec 2017 09:11:30 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>, Armin Kuster <akuster808@gmail.com>
References: <cover.1513527416.git.akuster@mvista.com>
	<1f6d1fa417f9a7128168b0ad934f4ae75a8198e3.1513527416.git.akuster@mvista.com>
	<CAJTo0Lb6JfFMJAH7_1Sph-VwhJ_6aD=-YXtWBfBSH8GWMT8Hcw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <e900fa4c-708c-a59c-8638-ba26ec754272@gmail.com>
Date: Mon, 18 Dec 2017 09:11:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb6JfFMJAH7_1Sph-VwhJ_6aD=-YXtWBfBSH8GWMT8Hcw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] bind: Update to 9.11.2
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
X-List-Received-Date: Mon, 18 Dec 2017 17:11:30 -0000
Content-Type: multipart/alternative;
	boundary="------------C8717301AD58B2FE19257C49"
Content-Language: en-US

--------------C8717301AD58B2FE19257C49
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 12/18/2017 07:05 AM, Burton, Ross wrote:
> On 17 December 2017 at 16:34, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     From: Armin Kuster <akuster@mvista.com <mailto:akuster@mvista.com>>=

>
>     New License (mpl-2.0) and LICESE file.
>
>     New features in bind 9.11
>     see:
>     https://www.isc.org/wp-content/uploads/2016/09/BIND9.11NewFeatures.=
pdf
>     <https://www.isc.org/wp-content/uploads/2016/09/BIND9.11NewFeatures=
=2Epdf>
>
>     add zlib PACKAGECONF
>
>
> packages/corei7-64-poky-linux/bind/bind-doc: FILELIST: removed
> "/usr/share/man/man8/dnssec-checkds.8
> /usr/share/man/man8/dnssec-coverage.8", added "/usr/share/man/man1/mdig=
=2E1"
>
> I see you're removing those binaries from a sed, so have they been
> removed entirely?=C2=A0 Are they somewhere else, or just disabled?

=C2=A0hmm, let me double check. I know there where no longer there.

>
> packages/corei7-64-poky-linux/bind/bind: FILELIST: removed
> "/usr/lib/python3.5/site-packages/isc/__pycache__/dnskey.cpython-35.pyc=

> /usr/lib/python3.5/site-packages/isc/__pycache__/coverage.cpython-35.py=
c
> /usr/lib/python3.5/site-packages/isc/eventlist.py
> /usr/lib/python3.5/site-packages/isc/keyevent.py
> /usr/lib/python3.5/site-packages/isc-1.0-py3.5.egg-info
> /usr/lib/python3.5/site-packages/isc/__pycache__/eventlist.cpython-35.p=
yc
> /usr/lib/python3.5/site-packages/isc/keydict.py
> /usr/lib/python3.5/site-packages/isc/__pycache__/keyzone.cpython-35.pyc=

> /usr/lib/python3.5/site-packages/isc/__pycache__/keydict.cpython-35.pyc=

> /usr/lib/python3.5/site-packages/isc/__pycache__/checkds.cpython-35.pyc=

> /usr/lib/python3.5/site-packages/isc/checkds.py
> /usr/sbin/dnssec-coverage
> /usr/lib/python3.5/site-packages/isc/keyzone.py
> /usr/lib/python3.5/site-packages/isc/__init__.py
> /usr/lib/python3.5/site-packages/isc/__pycache__/utils.cpython-35.pyc
> /usr/sbin/dnssec-checkds
> /usr/lib/python3.5/site-packages/isc/__pycache__/keyevent.cpython-35.py=
c
> /usr/lib/python3.5/site-packages/isc/__pycache__/__init__.cpython-35.py=
c
> /usr/lib/python3.5/site-packages/isc/dnskey.py
> /usr/lib/python3.5/site-packages/isc/coverage.py
> /usr/lib/python3.5/site-packages/isc/utils.py", added "/usr/bin/mdig"
>
> All the Python bindings have disappeared, is this intentional?

hmm.. let me check.

- armin
>
> Ross=C2=A0


--------------C8717301AD58B2FE19257C49
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
    <div class="moz-cite-prefix">On 12/18/2017 07:05 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0Lb6JfFMJAH7_1Sph-VwhJ_6aD=-YXtWBfBSH8GWMT8Hcw@mail.gmail.com">
      <div dir="ltr">On 17 December 2017 at 16:34, Armin Kuster <span
          dir="ltr">&lt;<a href="mailto:akuster808@gmail.com"
            target="_blank" moz-do-not-send="true">akuster808@gmail.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">From:
              Armin Kuster &lt;<a href="mailto:akuster@mvista.com"
                moz-do-not-send="true">akuster@mvista.com</a>&gt;<br>
              <br>
              New License (mpl-2.0) and LICESE file.<br>
              <br>
              New features in bind 9.11<br>
              see: <a
href="https://www.isc.org/wp-content/uploads/2016/09/BIND9.11NewFeatures.pdf"
                rel="noreferrer" target="_blank" moz-do-not-send="true">https://www.isc.org/wp-<wbr>content/uploads/2016/09/BIND9.<wbr>11NewFeatures.pdf</a><br>
              <br>
              add zlib PACKAGECONF<br>
            </blockquote>
            <div><br>
            </div>
            <div>packages/corei7-64-poky-linux/bind/bind-doc: FILELIST:
              removed "/usr/share/man/man8/dnssec-checkds.8
              /usr/share/man/man8/dnssec-coverage.8", added
              "/usr/share/man/man1/mdig.1"</div>
            <div><br>
            </div>
            <div>I see you're removing those binaries from a sed, so
              have they been removed entirely?  Are they somewhere else,
              or just disabled?</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
     hmm, let me double check. I know there where no longer there.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAJTo0Lb6JfFMJAH7_1Sph-VwhJ_6aD=-YXtWBfBSH8GWMT8Hcw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>packages/corei7-64-poky-linux/bind/bind: FILELIST:
              removed
              "/usr/lib/python3.5/site-packages/isc/__pycache__/dnskey.cpython-35.pyc
/usr/lib/python3.5/site-packages/isc/__pycache__/coverage.cpython-35.pyc
              /usr/lib/python3.5/site-packages/isc/eventlist.py
              /usr/lib/python3.5/site-packages/isc/keyevent.py
              /usr/lib/python3.5/site-packages/isc-1.0-py3.5.egg-info
/usr/lib/python3.5/site-packages/isc/__pycache__/eventlist.cpython-35.pyc
              /usr/lib/python3.5/site-packages/isc/keydict.py
              /usr/lib/python3.5/site-packages/isc/__pycache__/keyzone.cpython-35.pyc
/usr/lib/python3.5/site-packages/isc/__pycache__/keydict.cpython-35.pyc
/usr/lib/python3.5/site-packages/isc/__pycache__/checkds.cpython-35.pyc
              /usr/lib/python3.5/site-packages/isc/checkds.py
              /usr/sbin/dnssec-coverage
              /usr/lib/python3.5/site-packages/isc/keyzone.py
              /usr/lib/python3.5/site-packages/isc/__init__.py
              /usr/lib/python3.5/site-packages/isc/__pycache__/utils.cpython-35.pyc
              /usr/sbin/dnssec-checkds
              /usr/lib/python3.5/site-packages/isc/__pycache__/keyevent.cpython-35.pyc
/usr/lib/python3.5/site-packages/isc/__pycache__/__init__.cpython-35.pyc
              /usr/lib/python3.5/site-packages/isc/dnskey.py
              /usr/lib/python3.5/site-packages/isc/coverage.py
              /usr/lib/python3.5/site-packages/isc/utils.py", added
              "/usr/bin/mdig"</div>
            <div><br>
            </div>
            <div>All the Python bindings have disappeared, is this
              intentional?</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    hmm.. let me check. <br>
    <br>
    - armin<br>
    <blockquote type="cite"
cite="mid:CAJTo0Lb6JfFMJAH7_1Sph-VwhJ_6aD=-YXtWBfBSH8GWMT8Hcw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Ross </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------C8717301AD58B2FE19257C49--
