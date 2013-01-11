Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1TtYJm-0003Ho-95
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 07:42:40 +0100
Received: by mail-ea0-f182.google.com with SMTP id d1so541977eaa.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 22:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type;
	bh=snOsaAkvcmjmaa3kj+jqyLP5t9wuZr1Lz4xi6oKNuMc=;
	b=dhHWaI+gMCWTQyxNMhRjC8K6tox4dMdwVXH9Pve6nAfnQmDp7UywrShOelg/TT6+j3
	IIgq+y04ht+/9x2DMSeo0xMgAxH/lvi60xKmP6dwM2k5qcaUB6zU6fehMjDz+KxFF7Nz
	P2y8RzOQ/R8n6mArpWreNpVUJtAWAIqY6NAiYxf6VYbGhYAkRVY6kxMdg7QxsA1XIEwO
	BlfxVzC1lhoKWFb+uw7PVW12EbOp+JrNc64oIYoddcWH8p7eYuk+eJ6bfLCvtK4otcJJ
	y0/zYJBrWNxr1vgaEAzeAydf3LwF1tn9dJsaE/IXInxOC/tunsOzB2jI780bhIxo4mR8
	fnVQ==
X-Received: by 10.14.225.4 with SMTP id y4mr196557779eep.6.1357885623875;
	Thu, 10 Jan 2013 22:27:03 -0800 (PST)
Received: from [10.54.86.72] (64-103-25-233.cisco.com. [64.103.25.233])
	by mx.google.com with ESMTPS id b2sm7228504eep.9.2013.01.10.22.27.02
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 22:27:02 -0800 (PST)
Message-ID: <50EFB0B5.4000700@gmail.com>
Date: Fri, 11 Jan 2013 07:27:01 +0100
From: Martin Ertsaas <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.11) Gecko/20121128 Thunderbird/10.0.11
MIME-Version: 1.0
To: Chris Larson <clarson@kergoth.com>
References: <1357807806-31720-1-git-send-email-martiert@gmail.com>
	<1357807806-31720-4-git-send-email-martiert@gmail.com>
	<CABcZANkEeDdxgrb-2JqU19aofCgGor79wqKhvqktg+M34kenBg@mail.gmail.com>
In-Reply-To: <CABcZANkEeDdxgrb-2JqU19aofCgGor79wqKhvqktg+M34kenBg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] lib/oe/path.py: Use shutil.rmtree if the path we wish to remove is a directory.
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
X-List-Received-Date: Fri, 11 Jan 2013 06:43:04 -0000
Content-Type: multipart/alternative;
	boundary="------------060502030509020106050707"

--------------060502030509020106050707
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/13 15:15, Chris Larson wrote:
>
> On Thu, Jan 10, 2013 at 1:50 AM, Martin Ertsaas <martiert@gmail.com
> <mailto:martiert@gmail.com>> wrote:
>
>     On mac, os.unlink can not be done to remove directories, and so we
>     have to
>     explicitly use shutil.rmtree instead to support mac.
>
>
> As pointed out for the bitbake patch, the functions can already handle
> this case if you pass recurse=True, and mac isn't at all special in
> this context.
> -- 
> Christopher Larson
True. In this case though, I feel the patch is still valid though, and
that I should instead change the commit message. What I want from this
patch, as I see it again now, is to not duplicate the same code in both
bitbake and oe-core, when the oe-core function 'remove' can just be
calling bb.utils.remove. So personally I still want this patch, I just
wish to change the commit message to something sane. Agreed?

- Martin

--------------060502030509020106050707
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 01/10/13 15:15, Chris Larson wrote:
    <blockquote
cite="mid:CABcZANkEeDdxgrb-2JqU19aofCgGor79wqKhvqktg+M34kenBg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Thu, Jan 10, 2013 at 1:50 AM,
            Martin Ertsaas <span dir="ltr">&lt;<a
                moz-do-not-send="true" href="mailto:martiert@gmail.com"
                target="_blank">martiert@gmail.com</a>&gt;</span> wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div id=":1lu">On mac, os.unlink can not be done to remove
                directories, and so we have to<br>
                explicitly use shutil.rmtree instead to support mac.<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div style="">As pointed out for the bitbake patch, the
              functions can already handle this case if you pass
              recurse=True, and mac isn't at all special in this
              context.</div>
          </div>
          -- <br>
          Christopher Larson</div>
      </div>
    </blockquote>
    True. In this case though, I feel the patch is still valid though,
    and that I should instead change the commit message. What I want
    from this patch, as I see it again now, is to not duplicate the same
    code in both bitbake and oe-core, when the oe-core function 'remove'
    can just be calling bb.utils.remove. So personally I still want this
    patch, I just wish to change the commit message to something sane.
    Agreed?<br>
    <br>
    - Martin<br>
  </body>
</html>

--------------060502030509020106050707--
