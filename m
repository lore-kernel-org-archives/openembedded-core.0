Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id D2C5F7718D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jun 2016 22:55:12 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id z123so17634195itg.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jun 2016 15:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=3xwLrWDpVpztzEDM4/tXdYjvjq2zGtUfqJmnsnaLY90=;
	b=gDUnY+WP5ehaf+4VXaPPYDFtVfyzUl5lskdNDQOYHrhJhVNp+Rp4oR3gxALuI4znq0
	eXYr6X0kDRu8ZIO9d6Y8Hn6e+SFn8pXyoMtdvj3N7dwBWbw+2JNZ01W/x37ygJUbdtSc
	tRFJkZqeAvM8794KS1VFsxELab0L2SryOiACOGg1Mh3E4w9UE04aU9yzihQVAF6LvNC7
	LSJdaklw9O5qZZVSgZ0cy4gRJMrYCp0n2XiL8UAU7UWngbJpSBg1XsGZojrpcpWbZjB8
	vtZiksO4qiV5qU0/YmTDFv1LXGmHS6ocfNrumOC9JmiPMfWmOypo+qK1gGf+nVGHZaOc
	FwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=3xwLrWDpVpztzEDM4/tXdYjvjq2zGtUfqJmnsnaLY90=;
	b=G+p54VsOleNlhj45Ln63lDiEdK+bJArdhp/LHe8Y+2+Lr/tRC85VdrZg6sYKb1Wcmw
	BvU7KMXN6gdYOAt9P53CWuTyAg0WFnQLBTbVCHVth58mLCCYlIIK2q1WxZf9V/IdehNS
	T+qZsPpke5g8bX/1ejVe2+Xs/+u5tVDCSGeuwW0FCvZhhM9I2zTEfZ3G7FOO0ONDrKmp
	6wwodrFD9DtlNUwIaSErRsZc4cmUZz5ovemKTCzAAkgnLDd+gkfQ3k2k0Yj0kWlKskCu
	oNlg/3vO4oir9GSRn+qCHHjidQoXjm502Qh1QALfxe++KWA5/htV0VNECdN6IpFeJ2tU
	Hf8w==
X-Gm-Message-State: ALyK8tJrJQsMhs6mSflG8P8/x+n9rWxfvs+zxsWYWxuddn7Vwg8HLEYzyfyVO9MbJAKbkQ==
X-Received: by 10.36.115.76 with SMTP id y73mr8058241itb.63.1465080913125;
	Sat, 04 Jun 2016 15:55:13 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	d74sm2822070ith.13.2016.06.04.15.55.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Jun 2016 15:55:12 -0700 (PDT)
Date: Sat, 4 Jun 2016 18:55:09 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <20160604225509.GB28175@openSUSE-i7.site>
MIME-Version: 1.0
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: INHERIT += "image-buildinfo" doesn't parse
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
X-List-Received-Date: Sat, 04 Jun 2016 22:55:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Any config with
	INHERIT += "image-buildinfo"
doesn't parse on master (updated moments ago):

	ERROR: Error in compiling python function in /z/layerindex-master/layers/meta-poky/meta/classes/image-buildinfo.bbclass, line 27:

	The code lines resulting in this error were:
	SyntaxError: invalid syntax (image-buildinfo.bbclass, line 35)
	ERROR: Error parsing configuration files
	Traceback (most recent call last):
	  File "/z/layerindex-master/layers/meta-poky/bitbake/lib/bb/parse/parse_py/BBHandler.py", line 145, in handle(fn='/z/layerindex-master/layers/meta-poky/meta/classes/image-buildinfo.bbclass', d=<bb.data_smart.DataSmart object at 0x7fb5df5367f0>, include=True):
		 try:
	    >        statements.eval(d)
		 except bb.parse.SkipRecipe:
	  File "/z/layerindex-master/layers/meta-poky/bitbake/lib/bb/parse/ast.py", line 38, in StatementGroup.eval(data=<bb.data_smart.DataSmart object at 0x7fb5df5367f0>):
		     for statement in self:
	    >            statement.eval(data)
	     
	  File "/z/layerindex-master/layers/meta-poky/bitbake/lib/bb/parse/ast.py", line 187, in PythonMethodNode.eval(data=<bb.data_smart.DataSmart object at 0x7fb5df5367f0>):
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

