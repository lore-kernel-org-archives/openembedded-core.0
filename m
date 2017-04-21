Return-Path: <akuster808@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id CC01B71996
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 15:56:12 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id d203so31817830iof.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 08:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=EFZ5X3iMi831Bv49FwXsLIQCit4L9680pMG5CqwiJKI=;
	b=cAZK/pfvbmhxo/4C6Gqg7t4byHMdgVaYR796CNjHuF9V7mpAZV3NkhKpKLiJEHlc+3
	pawPhkoyIQAmTHcciOed03HoAuyvx/YusgwHjKPBYAMbYGmIPTznn0Nio74GSqAyaqvM
	c5BLf4YEiQBLNBpQX1Mn0Mc5yln/rciNKIrdavE7kYieBqWtHfj2c9nRoRtX4OgXqCcj
	W4UwH/Xvju3wtMtyQ+WOr/kSUPVyNYVwGZXTLENYuWfhO9uwMEM1BQe2JKkKoyOMJ7q6
	UOzwdHbVWfheMqyh74kNJBTquzmsRYG59hgzk9W0ykxp/C8FtHHzsshHC7gharvkPRP0
	ZBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=EFZ5X3iMi831Bv49FwXsLIQCit4L9680pMG5CqwiJKI=;
	b=ReKceJxvYBVz2DlgzPjlXCZ1febhvhIrKFoPMBXi5ejQWI23b1cHpYlD2c/EDIA3tf
	Ys04DQm+CUxRbnVNjdGh2mzLD45tUnw72Crp9tZpr6kMmU6pzGD+NjhYQKMTN3xxl0wc
	gX29Dkf0aO7KbyWWjYhkX2RjrN5X3k4CXV6EWOZWk6uTlC8O6qQ1uEZVCB2UN31TYDFS
	FU8aKALQvCQHqIF7zTi0S1kL9w2ooiEIvGL3sYWSoFcKjLkzpkj4ZqlyMqa56aTJ4hY5
	e15d9aGfJ3ibr70efrEs5D7f3fYuf1JyVh8KW8NwZ+MbBMHPkyZbE1/pbaumrmt4UCgM
	q3OA==
X-Gm-Message-State: AN3rC/4G8IlNSu7o5ZEIrOuJCWDcXWeaFGJIiSGr9+lm6RBrXwdnJ6xF
	pnGEzFhhttUo3A==
X-Received: by 10.98.72.144 with SMTP id q16mr13321060pfi.152.1492790173484;
	Fri, 21 Apr 2017 08:56:13 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:e3df:bf0a:9f90:498e?
	([2601:202:4001:9ea0:e3df:bf0a:9f90:498e])
	by smtp.gmail.com with ESMTPSA id
	y202sm1832111pfb.15.2017.04.21.08.56.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Apr 2017 08:56:13 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <bd7ec72b-fe78-65bd-7d25-65e51a0aa30e@gmail.com>
Date: Fri, 21 Apr 2017 08:55:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com>
Subject: Re: linux-yocto.do_validate_branches failing since last oe-core update
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
X-List-Received-Date: Fri, 21 Apr 2017 15:56:20 -0000
Content-Type: multipart/alternative;
	boundary="------------60B7F15A680198F7E23201FD"

--------------60B7F15A680198F7E23201FD
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit



On 04/21/2017 01:36 AM, Martin Jansa wrote:
> Anyone else seeing this as well?

yes

- armin
> I've updated to oe-core commit:
> c6cd5865b6914521a841ae0c9f4e2bcda99beff2
> from some revision maybe 20-40 commits older and now I'm seeing:
> ERROR: linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0 do_validate_branches: Function failed: do_validate_branches (log file is located at linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_validate_branches.5385)
> ERROR: Logfile of failure stored in: linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_validate_branches.5385
> Log data follows:
> | DEBUG: Executing shell function do_validate_branches
> | HEAD is now at fe0fb8d Merge tag 'v4.10.9' into standard/base
> | mkdir: cannot create directory ‘.’: File exists
> |
> | [ERROR] Can't find patch dir at ./patches/standard/base
> | usage: kgit s2q
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_validate_branches (log file is located at linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_validate_branches.5385)
> NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0: task do_validate_branches: Failed
> ERROR: Task (oe-core/meta/recipes-kernel/linux/linux-yocto_4.10.bb:do_validate_branches) failed with exit code '1'
>
>


--------------60B7F15A680198F7E23201FD
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 04/21/2017 01:36 AM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote
cite="mid:CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">Anyone else seeing this as well?</pre>
      </div>
    </blockquote>
    <br>
    yes<br>
    <br>
    - armin<br>
    <blockquote
cite="mid:CA+chaQdQz3==KgsjLby6Bx1NgnzhXKXQcvCY5pufr5gLeqMqtQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">
</pre>
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">I've updated to oe-core commit:</pre>
        <pre class="gmail-console-output" style="box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom:0px"><font color="#333333"><span style="font-size:14px;white-space:pre-wrap">c6cd5865b6914521a841ae0c9f4e2bcda99beff2
</span></font></pre>
        <pre class="gmail-console-output" style="box-sizing:border-box;word-wrap:break-word;margin-top:0px;margin-bottom:0px"><font color="#333333"><span style="font-size:14px;white-space:pre-wrap">from some revision maybe 20-40 commits older and now I'm seeing:</span></font></pre>
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">
</pre>
        <pre class="gmail-console-output" style="box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">ERROR: linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0 do_validate_branches: Function failed: do_validate_branches (log file is located at linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_validate_branches.5385)
ERROR: Logfile of failure stored in: linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_validate_branches.5385
Log data follows:
| DEBUG: Executing shell function do_validate_branches
| HEAD is now at fe0fb8d Merge tag 'v4.10.9' into standard/base
| mkdir: cannot create directory ‘.’: File exists
| 
| [ERROR] Can't find patch dir at ./patches/standard/base
| usage: kgit s2q
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_validate_branches (log file is located at linux-yocto/1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0/temp/log.do_validate_branches.5385)
NOTE: recipe linux-yocto-1_4.10.9+gitAUTOINC+ad2e885015_fe0fb8da3d-r0: task do_validate_branches: Failed
ERROR: Task (oe-core/meta/recipes-kernel/linux/linux-yocto_4.10.bb:do_validate_branches) failed with exit code '1'</pre>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------60B7F15A680198F7E23201FD--
