Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id A086C77193
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Jun 2016 13:02:50 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id k19so105330075ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jun 2016 06:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=SLIEi+1uoKVbSrkX0T3r0tCg7VGvgKngxeTNwZ8vIcg=;
	b=CyphYlSrmhsjYJGAQ8MTbOOwNS9ND0DQZSBLpxvzJH9ozmugXjN/b5vTUoaUaC9srU
	FymhkCMrcF2PoN6/wmBC+vSYpAPsnBR6WKgIckQxf7VNDDBZz8Rtwxx862CUJG0KSNx3
	j8ITBtYxXXwBLCtBWokpKqgh7nrnYfOnbf+l5k/N/g5BbLfJ9fpGxbMkV39/yDDuDlSQ
	/j7W5VcbMKagVB7RtqJ8Ua72CeQnMT2jvv6+nC27Bnv0ojyKZVkPj3RStWb5pOD3xqLM
	YIqxhA4Dea0bg1FMhruerqb5VIIRuhmvQcGRF4FQ4zoRnWV21B/IxhYaan4LvPbtf84T
	394w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SLIEi+1uoKVbSrkX0T3r0tCg7VGvgKngxeTNwZ8vIcg=;
	b=P7fIMmbgvBFn2mCGZBwg1wO/Nc3AUYFctc9GMvsQsUC6hcjiFYLgqx1vuZyf/tlha0
	T0dltTy9dLFzTbZfNTem4/G6x912SEqYHo2JGIAL//k+zOBn3AxP/BOou5hm08HalGxr
	ig6EBxAp2WeOR3QymKpDUuCxJnF7a+Az3pi5xf7r24gL63EIZQxl79zKBS6avYbdqS0j
	zlG1/tlRyJCq76k63r0BkymRUa1gfzhTwuXqjRTNlRscxDH7RQGamj6cHNu+qPlrei0U
	cYlzn6N0uUpm1PF9SyFMqQ86KBloybOYsABrudhnYurMNUiirs63VSdTPGlidh7LOZVA
	EtaA==
X-Gm-Message-State: ALyK8tIua66nDPPc+pOZWT+SkkxK9EEY6BphJoJcWW1N9BBxzno7VJMJuiO8rPy4i8X12A==
X-Received: by 10.107.59.18 with SMTP id i18mr15600146ioa.161.1465131770881;
	Sun, 05 Jun 2016 06:02:50 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id j9sm160566itj.8.2016.06.05.06.02.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Jun 2016 06:02:50 -0700 (PDT)
Date: Sun, 5 Jun 2016 09:02:53 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160605130253.GB5652@openSUSE-i7.site>
References: <20160604225509.GB28175@openSUSE-i7.site>
	<1465111211.13979.38.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1465111211.13979.38.camel@linuxfoundation.org>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: INHERIT += "image-buildinfo" doesn't parse
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
X-List-Received-Date: Sun, 05 Jun 2016 13:02:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun 2016-06-05 @ 08:20:11 AM, Richard Purdie wrote:
> On Sat, 2016-06-04 at 18:55 -0400, Trevor Woerner wrote:
> > Any config with
> > 	INHERIT += "image-buildinfo"
> > doesn't parse on master (updated moments ago):
> > 
> > 	ERROR: Error in compiling python function in /z/layerindex
> > -master/layers/meta-poky/meta/classes/image-buildinfo.bbclass, line
> > 27:
> > 
> > 	The code lines resulting in this error were:
> > 	SyntaxError: invalid syntax (image-buildinfo.bbclass, line 35)
> > 
> > 	bb.BBHandledException: invalid syntax (image-buildinfo.bbclass,
> > line 35)
> 
> I've tweaked line 35 which used an obsolete python syntax so was an
> obvious/trivial fix. I've not tested it though...

I've pulled your change (6e7d9dd9b5cbf46b955036876a25353fafbf264c) but it's
still not happy:

ERROR: Error parsing configuration files
Traceback (most recent call last):
  File "/z/layerindex-master/layers/meta-poky/bitbake/lib/bb/parse/parse_py/BBHandler.py", line 145, in handle(fn='/z/layerindex-master/layers/meta-poky/meta/classes/image-buildinfo.bbclass', d=<bb.data_smart.DataSmart object at 0x7f90650ee828>, include=True):
         try:
    >        statements.eval(d)
         except bb.parse.SkipRecipe:
  File "/z/layerindex-master/layers/meta-poky/bitbake/lib/bb/parse/ast.py", line 38, in StatementGroup.eval(data=<bb.data_smart.DataSmart object at 0x7f90650ee828>):
             for statement in self:
    >            statement.eval(data)

  File "/z/layerindex-master/layers/meta-poky/bitbake/lib/bb/parse/ast.py", line 187, in PythonMethodNode.eval(data=<bb.data_smart.DataSmart object at 0x7f90650ee828>):
             text = '\n'.join(self.body)
    >        bb.methodpool.insert_method(self.modulename, text, self.filename, self.lineno - len(self.body) - 1)
             data.setVarFlag(self.function, "func", 1)
  File "/z/layerindex-master/layers/meta-poky/bitbake/lib/bb/methodpool.py", line 27, in insert_method(modulename='image-buildinfo.bbclass', code='def get_layer_git_status(path):\n    import subprocess\n    try:\n        subprocess.check_output("cd %s; PSEUDO_UNLOAD=1 git diff --quiet --no-ext-diff" % path,\n                                shell=True,\n                                stderr=subprocess.STDOUT)\n        return ""\n    except subprocess.CalledProcessError, ex:\n        # Silently treat errors as "modified", without checking for the\n        # (expected) return code 1 in a modified git repo. For example, we get\n        # output and a 129 return code when a layer isn\'t a git repo at all.\n        return "-- modified"\n', fn='/z/layerindex-master/layers/meta-poky/meta/classes/image-buildinfo.bbclass', lineno=27):
         """
    >    comp = better_compile(code, modulename, fn, lineno=lineno)
         better_exec(comp, None, code, fn)
  File "/z/layerindex-master/layers/meta-poky/bitbake/lib/bb/utils.py", line 330, in better_compile(text='def get_layer_git_status(path):\n    import subprocess\n    try:\n        subprocess.check_output("cd %s; PSEUDO_UNLOAD=1 git diff --quiet --no-ext-diff" % path,\n                                shell=True,\n                                stderr=subprocess.STDOUT)\n        return ""\n    except subprocess.CalledProcessError, ex:\n        # Silently treat errors as "modified", without checking for the\n        # (expected) return code 1 in a modified git repo. For example, we get\n        # output and a 129 return code when a layer isn\'t a git repo at all.\n        return "-- modified"\n', file='image-buildinfo.bbclass', realfile='/z/layerindex-master/layers/meta-poky/meta/classes/image-buildinfo.bbclass', mode='exec', lineno=27):
             e = bb.BBHandledException(e)
    >        raise e

bb.BBHandledException: invalid syntax (image-buildinfo.bbclass, line 35)

