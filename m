Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63614C46467
	for <webhook@archiver.kernel.org>; Sat, 14 Jan 2023 15:49:33 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.118669.1673711369176907262
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 07:49:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HleaN/EU;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id gz9-20020a17090b0ec900b002290bda1b07so3346382pjb.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 07:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6eMy4Gh4k9B4PQdD32Ythp2P0WhUGjyGZ3E04pK7YnY=;
        b=HleaN/EUy3WVoqq9W2aIzHLnE3RVz8p+LmMNGIdMsF4Nkynww+sGHCEC4FFPbc77KC
         pgEyN42of8CMOuIy1/scFI0A4l+GJzM05U7f1Pt780Hya+cOWitoUs4I9qKi1+Uw5BWz
         IZbYeJmIo169EXtFHQK4NMDyl4jiY4dnE7SACYfFUDalI4ZMgqYDoTRra8FN/Hu2GDMl
         6zOhqGcWmkL3mX67jLNl9L0EX8s72NjL7bXFbi9LQRMM6Ox5Ub5O3a4VBZDeWkKq/kmX
         6jrt+r8X6vUQMA4qYQSVOO+C6gdZlSckjaGMJQ/ctS+8QqtPlb/QBferwfG2fWC3/hvi
         N2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6eMy4Gh4k9B4PQdD32Ythp2P0WhUGjyGZ3E04pK7YnY=;
        b=3RM0Q0RDoG8jlKDTAm9R1Z2l7/ju7ukwnqklZ4DBwU334uG/23EgwHLzfj7gWgjxB3
         /Z8a+wkA6LVRHi+qH6DzTI/6bzBbSgSGq3WC2oCbC6005CUVo4gRH1alOkKCBRH962c7
         qBFaB1XlqL1faQMAiY2qBCJwTrs9YUL+6+kLRKUFRj/a5t6+X2BNGjJqEYyBsYUkcUZL
         g5/LfS3B0ZLA9+mGN2k/Iz1Rkni2BXN/ohrmDqNf+Ig5JIMBUVLwriRrlb+4yVe94fOT
         hbbdM0yMywPEDuaSlf/k8tu64hMNaeHRsPz4+R6Sr9qO56BEQvPHLg8iVDVaAAPO5Q+L
         +fVA==
X-Gm-Message-State: AFqh2kpVKEC2NIAN3SibuzX8+BSgicyA12PU6yJyysDl+dHdUW7Y8Dv6
	tPZ8/SAurLbhec3KVBXy6BZJb+cQd+cWuw==
X-Google-Smtp-Source: AMrXdXsaY7l5OiY9ZRF62nZ1KIql97+S8X+iVHHibudnvl5Uv32AeRjoaHBpdQDLxWC/YOo5zoD/hg==
X-Received: by 2002:a17:90a:ff0e:b0:227:203a:e649 with SMTP id ce14-20020a17090aff0e00b00227203ae649mr21190340pjb.16.1673711368259;
        Sat, 14 Jan 2023 07:49:28 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id b7-20020a63eb47000000b00460ea630c1bsm13129200pgk.46.2023.01.14.07.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 07:49:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/5] vulkan-samples: Update to the tip of trunk
Date: Sat, 14 Jan 2023 07:49:19 -0800
Message-Id: <20230114154921.3757493-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114154921.3757493-1-raj.khem@gmail.com>
References: <20230114154921.3757493-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 15:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175852

Drop backported patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...o-not-hardcode-lib-as-installation-t.patch |  29 --
 .../0001-Qualify-move-as-std-move.patch       | 405 ------------------
 .../vulkan/vulkan-samples_git.bb              |   4 +-
 3 files changed, 1 insertion(+), 437 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-Qualify-move-as-std-move.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch
deleted file mode 100644
index 90fe277a41..0000000000
--- a/meta/recipes-graphics/vulkan/vulkan-samples/0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 5fb216d35b6846074196e80421f3162df3b9c8cd Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sun, 1 Nov 2020 23:19:22 +0000
-Subject: [PATCH] CMakeLists.txt: do not hardcode 'lib' as installation target
-
-Upstream-Status: Inappropriate [already fixed in newer versions]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e00f8c77..f9896eed 100644
---- a/third_party/spirv-cross/CMakeLists.txt
-+++ b/third_party/spirv-cross/CMakeLists.txt
-@@ -67,8 +67,8 @@ macro(spirv_cross_add_library name config_name)
-   install(TARGETS ${name}
-       EXPORT ${config_name}Config
-       RUNTIME DESTINATION bin
--      LIBRARY DESTINATION lib
--      ARCHIVE DESTINATION lib
-+      LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+      ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
-       PUBLIC_HEADER DESTINATION include/spirv_cross)
-   install(FILES ${hdrs} DESTINATION include/spirv_cross)
-   install(EXPORT ${config_name}Config DESTINATION share/${config_name}/cmake)
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-Qualify-move-as-std-move.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-Qualify-move-as-std-move.patch
deleted file mode 100644
index 80ee521499..0000000000
--- a/meta/recipes-graphics/vulkan/vulkan-samples/0001-Qualify-move-as-std-move.patch
+++ /dev/null
@@ -1,405 +0,0 @@
-From 9e061b12b9305eee96a4d3129b646c244cc02347 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 14 Aug 2022 19:16:45 -0700
-Subject: [PATCH] Qualify move as std::move
-
-Seeing errors like below with clang-15
-
-spirv_common.hpp:692:19: error: unqualified call to std::move
-
-squashed Backport of following upstream commits
-
-https://github.com/KhronosGroup/SPIRV-Cross/commit/44c3333a1c315ead00c24f7aef5fa8a7ccf49299
-https://github.com/KhronosGroup/SPIRV-Cross/commit/0eda71c40936586ea812d0d20d93c11a3e9af192
-
-Upstream-Status: Backport [https://github.com/KhronosGroup/SPIRV-Cross/commit/0eda71c40936586ea812d0d20d93c11a3e9af192]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- main.cpp          | 38 +++++++++++++++++++-------------------
- spirv_common.hpp  |  2 +-
- spirv_cpp.hpp     |  2 +-
- spirv_cross.cpp   | 18 +++++++++---------
- spirv_glsl.cpp    |  2 +-
- spirv_glsl.hpp    |  2 +-
- spirv_hlsl.cpp    |  4 ++--
- spirv_hlsl.hpp    |  2 +-
- spirv_msl.cpp     |  2 +-
- spirv_parser.cpp  |  4 ++--
- spirv_reflect.hpp |  2 +-
- 11 files changed, 39 insertions(+), 39 deletions(-)
-
-diff --git a/main.cpp b/main.cpp
-index 78991094..581c5e3b 100644
---- a/main.cpp
-+++ b/main.cpp
-@@ -65,7 +65,7 @@ struct CLICallbacks
- struct CLIParser
- {
- 	CLIParser(CLICallbacks cbs_, int argc_, char *argv_[])
--	    : cbs(move(cbs_))
-+	    : cbs(std::move(cbs_))
- 	    , argc(argc_)
- 	    , argv(argv_)
- 	{
-@@ -722,7 +722,7 @@ static int main_inner(int argc, char *argv[])
- 		auto old_name = parser.next_string();
- 		auto new_name = parser.next_string();
- 		auto model = stage_to_execution_model(parser.next_string());
--		args.entry_point_rename.push_back({ old_name, new_name, move(model) });
-+		args.entry_point_rename.push_back({ old_name, new_name, std::move(model) });
- 	});
- 	cbs.add("--entry", [&args](CLIParser &parser) { args.entry = parser.next_string(); });
- 	cbs.add("--stage", [&args](CLIParser &parser) { args.entry_stage = parser.next_string(); });
-@@ -731,20 +731,20 @@ static int main_inner(int argc, char *argv[])
- 		HLSLVertexAttributeRemap remap;
- 		remap.location = parser.next_uint();
- 		remap.semantic = parser.next_string();
--		args.hlsl_attr_remap.push_back(move(remap));
-+		args.hlsl_attr_remap.push_back(std::move(remap));
- 	});
- 
- 	cbs.add("--remap", [&args](CLIParser &parser) {
- 		string src = parser.next_string();
- 		string dst = parser.next_string();
- 		uint32_t components = parser.next_uint();
--		args.remaps.push_back({ move(src), move(dst), components });
-+		args.remaps.push_back({ std::move(src), std::move(dst), components });
- 	});
- 
- 	cbs.add("--remap-variable-type", [&args](CLIParser &parser) {
- 		string var_name = parser.next_string();
- 		string new_type = parser.next_string();
--		args.variable_type_remaps.push_back({ move(var_name), move(new_type) });
-+		args.variable_type_remaps.push_back({ std::move(var_name), std::move(new_type) });
- 	});
- 
- 	cbs.add("--rename-interface-variable", [&args](CLIParser &parser) {
-@@ -757,18 +757,18 @@ static int main_inner(int argc, char *argv[])
- 
- 		uint32_t loc = parser.next_uint();
- 		string var_name = parser.next_string();
--		args.interface_variable_renames.push_back({ cls, loc, move(var_name) });
-+		args.interface_variable_renames.push_back({ cls, loc, std::move(var_name) });
- 	});
- 
- 	cbs.add("--pls-in", [&args](CLIParser &parser) {
- 		auto fmt = pls_format(parser.next_string());
- 		auto name = parser.next_string();
--		args.pls_in.push_back({ move(fmt), move(name) });
-+		args.pls_in.push_back({ std::move(fmt), std::move(name) });
- 	});
- 	cbs.add("--pls-out", [&args](CLIParser &parser) {
- 		auto fmt = pls_format(parser.next_string());
- 		auto name = parser.next_string();
--		args.pls_out.push_back({ move(fmt), move(name) });
-+		args.pls_out.push_back({ std::move(fmt), std::move(name) });
- 	});
- 	cbs.add("--shader-model", [&args](CLIParser &parser) {
- 		args.shader_model = parser.next_uint();
-@@ -788,7 +788,7 @@ static int main_inner(int argc, char *argv[])
- 	cbs.default_handler = [&args](const char *value) { args.input = value; };
- 	cbs.error_handler = [] { print_help(); };
- 
--	CLIParser parser{ move(cbs), argc - 1, argv + 1 };
-+	CLIParser parser{ std::move(cbs), argc - 1, argv + 1 };
- 	if (!parser.parse())
- 	{
- 		return EXIT_FAILURE;
-@@ -808,14 +808,14 @@ static int main_inner(int argc, char *argv[])
- 	auto spirv_file = read_spirv_file(args.input);
- 	if (spirv_file.empty())
- 		return EXIT_FAILURE;
--	Parser spirv_parser(move(spirv_file));
-+	Parser spirv_parser(std::move(spirv_file));
- 
- 	spirv_parser.parse();
- 
- 	// Special case reflection because it has little to do with the path followed by code-outputting compilers
- 	if (!args.reflect.empty())
- 	{
--		CompilerReflection compiler(move(spirv_parser.get_parsed_ir()));
-+		CompilerReflection compiler(std::move(spirv_parser.get_parsed_ir()));
- 		compiler.set_format(args.reflect);
- 		auto json = compiler.compile();
- 		if (args.output)
-@@ -831,13 +831,13 @@ static int main_inner(int argc, char *argv[])
- 
- 	if (args.cpp)
- 	{
--		compiler.reset(new CompilerCPP(move(spirv_parser.get_parsed_ir())));
-+		compiler.reset(new CompilerCPP(std::move(spirv_parser.get_parsed_ir())));
- 		if (args.cpp_interface_name)
- 			static_cast<CompilerCPP *>(compiler.get())->set_interface_name(args.cpp_interface_name);
- 	}
- 	else if (args.msl)
- 	{
--		compiler.reset(new CompilerMSL(move(spirv_parser.get_parsed_ir())));
-+		compiler.reset(new CompilerMSL(std::move(spirv_parser.get_parsed_ir())));
- 
- 		auto *msl_comp = static_cast<CompilerMSL *>(compiler.get());
- 		auto msl_opts = msl_comp->get_msl_options();
-@@ -850,13 +850,13 @@ static int main_inner(int argc, char *argv[])
- 		msl_comp->set_msl_options(msl_opts);
- 	}
- 	else if (args.hlsl)
--		compiler.reset(new CompilerHLSL(move(spirv_parser.get_parsed_ir())));
-+		compiler.reset(new CompilerHLSL(std::move(spirv_parser.get_parsed_ir())));
- 	else
- 	{
- 		combined_image_samplers = !args.vulkan_semantics;
- 		if (!args.vulkan_semantics)
- 			build_dummy_sampler = true;
--		compiler.reset(new CompilerGLSL(move(spirv_parser.get_parsed_ir())));
-+		compiler.reset(new CompilerGLSL(std::move(spirv_parser.get_parsed_ir())));
- 	}
- 
- 	if (!args.variable_type_remaps.empty())
-@@ -867,7 +867,7 @@ static int main_inner(int argc, char *argv[])
- 					out = remap.new_variable_type;
- 		};
- 
--		compiler->set_variable_type_remap_callback(move(remap_cb));
-+		compiler->set_variable_type_remap_callback(std::move(remap_cb));
- 	}
- 
- 	for (auto &rename : args.entry_point_rename)
-@@ -1019,7 +1019,7 @@ static int main_inner(int argc, char *argv[])
- 	{
- 		auto active = compiler->get_active_interface_variables();
- 		res = compiler->get_shader_resources(active);
--		compiler->set_enabled_interface_variables(move(active));
-+		compiler->set_enabled_interface_variables(std::move(active));
- 	}
- 	else
- 		res = compiler->get_shader_resources();
-@@ -1034,7 +1034,7 @@ static int main_inner(int argc, char *argv[])
- 
- 	auto pls_inputs = remap_pls(args.pls_in, res.stage_inputs, &res.subpass_inputs);
- 	auto pls_outputs = remap_pls(args.pls_out, res.stage_outputs, nullptr);
--	compiler->remap_pixel_local_storage(move(pls_inputs), move(pls_outputs));
-+	compiler->remap_pixel_local_storage(std::move(pls_inputs), std::move(pls_outputs));
- 
- 	for (auto &ext : args.extensions)
- 		compiler->require_extension(ext);
-@@ -1101,7 +1101,7 @@ static int main_inner(int argc, char *argv[])
- 	for (uint32_t i = 0; i < args.iterations; i++)
- 	{
- 		if (args.hlsl)
--			glsl = static_cast<CompilerHLSL *>(compiler.get())->compile(move(args.hlsl_attr_remap));
-+			glsl = static_cast<CompilerHLSL *>(compiler.get())->compile(std::move(args.hlsl_attr_remap));
- 		else
- 			glsl = compiler->compile();
- 	}
-diff --git a/spirv_common.hpp b/spirv_common.hpp
-index aa32142d..0daf5ad5 100644
---- a/spirv_common.hpp
-+++ b/spirv_common.hpp
-@@ -536,7 +536,7 @@ struct SPIRExpression : IVariant
- 
- 	// Only created by the backend target to avoid creating tons of temporaries.
- 	SPIRExpression(std::string expr, uint32_t expression_type_, bool immutable_)
--	    : expression(move(expr))
-+	    : expression(std::move(expr))
- 	    , expression_type(expression_type_)
- 	    , immutable(immutable_)
- 	{
-diff --git a/spirv_cpp.hpp b/spirv_cpp.hpp
-index bcdb669b..b4da84b9 100644
---- a/spirv_cpp.hpp
-+++ b/spirv_cpp.hpp
-@@ -27,7 +27,7 @@ class CompilerCPP : public CompilerGLSL
- {
- public:
- 	explicit CompilerCPP(std::vector<uint32_t> spirv_)
--	    : CompilerGLSL(move(spirv_))
-+	    : CompilerGLSL(std::move(spirv_))
- 	{
- 	}
- 
-diff --git a/spirv_cross.cpp b/spirv_cross.cpp
-index 19bac301..d21dbd41 100644
---- a/spirv_cross.cpp
-+++ b/spirv_cross.cpp
-@@ -28,16 +28,16 @@ using namespace spirv_cross;
- 
- Compiler::Compiler(vector<uint32_t> ir_)
- {
--	Parser parser(move(ir_));
-+	Parser parser(std::move(ir_));
- 	parser.parse();
--	set_ir(move(parser.get_parsed_ir()));
-+	set_ir(std::move(parser.get_parsed_ir()));
- }
- 
- Compiler::Compiler(const uint32_t *ir_, size_t word_count)
- {
- 	Parser parser(ir_, word_count);
- 	parser.parse();
--	set_ir(move(parser.get_parsed_ir()));
-+	set_ir(std::move(parser.get_parsed_ir()));
- }
- 
- Compiler::Compiler(const ParsedIR &ir_)
-@@ -47,12 +47,12 @@ Compiler::Compiler(const ParsedIR &ir_)
- 
- Compiler::Compiler(ParsedIR &&ir_)
- {
--	set_ir(move(ir_));
-+	set_ir(std::move(ir_));
- }
- 
- void Compiler::set_ir(ParsedIR &&ir_)
- {
--	ir = move(ir_);
-+	ir = std::move(ir_);
- 	parse_fixup();
- }
- 
-@@ -716,7 +716,7 @@ unordered_set<uint32_t> Compiler::get_active_interface_variables() const
- 
- void Compiler::set_enabled_interface_variables(std::unordered_set<uint32_t> active_variables)
- {
--	active_interface_variables = move(active_variables);
-+	active_interface_variables = std::move(active_variables);
- 	check_active_interface_variables = true;
- }
- 
-@@ -2163,7 +2163,7 @@ void Compiler::CombinedImageSamplerHandler::push_remap_parameters(const SPIRFunc
- 	unordered_map<uint32_t, uint32_t> remapping;
- 	for (uint32_t i = 0; i < length; i++)
- 		remapping[func.arguments[i].id] = remap_parameter(args[i]);
--	parameter_remapping.push(move(remapping));
-+	parameter_remapping.push(std::move(remapping));
- }
- 
- void Compiler::CombinedImageSamplerHandler::pop_remap_parameters()
-@@ -3611,7 +3611,7 @@ void Compiler::analyze_image_and_sampler_usage()
- 
- 	CombinedImageSamplerUsageHandler handler(*this, dref_handler.dref_combined_samplers);
- 	traverse_all_reachable_opcodes(get<SPIRFunction>(ir.default_entry_point), handler);
--	comparison_ids = move(handler.comparison_ids);
-+	comparison_ids = std::move(handler.comparison_ids);
- 	need_subpass_input = handler.need_subpass_input;
- 
- 	// Forward information from separate images and samplers into combined image samplers.
-@@ -3650,7 +3650,7 @@ void Compiler::build_function_control_flow_graphs_and_analyze()
- 	CFGBuilder handler(*this);
- 	handler.function_cfgs[ir.default_entry_point].reset(new CFG(*this, get<SPIRFunction>(ir.default_entry_point)));
- 	traverse_all_reachable_opcodes(get<SPIRFunction>(ir.default_entry_point), handler);
--	function_cfgs = move(handler.function_cfgs);
-+	function_cfgs = std::move(handler.function_cfgs);
- 
- 	for (auto &f : function_cfgs)
- 	{
-diff --git a/spirv_glsl.cpp b/spirv_glsl.cpp
-index a8855987..fabbb105 100644
---- a/spirv_glsl.cpp
-+++ b/spirv_glsl.cpp
-@@ -6876,7 +6876,7 @@ void CompilerGLSL::emit_instruction(const Instruction &instruction)
- 		bool ptr_chain = opcode == OpPtrAccessChain;
- 		auto e = access_chain(ops[2], &ops[3], length - 3, get<SPIRType>(ops[0]), &meta, ptr_chain);
- 
--		auto &expr = set<SPIRExpression>(ops[1], move(e), ops[0], should_forward(ops[2]));
-+		auto &expr = set<SPIRExpression>(ops[1], std::move(e), ops[0], should_forward(ops[2]));
- 
- 		auto *backing_variable = maybe_get_backing_variable(ops[2]);
- 		expr.loaded_from = backing_variable ? backing_variable->self : ops[2];
-diff --git a/spirv_glsl.hpp b/spirv_glsl.hpp
-index caf0ad3b..aac1196e 100644
---- a/spirv_glsl.hpp
-+++ b/spirv_glsl.hpp
-@@ -138,7 +138,7 @@ public:
- 	}
- 
- 	explicit CompilerGLSL(std::vector<uint32_t> spirv_)
--	    : Compiler(move(spirv_))
-+	    : Compiler(std::move(spirv_))
- 	{
- 		init();
- 	}
-diff --git a/spirv_hlsl.cpp b/spirv_hlsl.cpp
-index a5b6d2dc..0933017e 100644
---- a/spirv_hlsl.cpp
-+++ b/spirv_hlsl.cpp
-@@ -2028,7 +2028,7 @@ void CompilerHLSL::emit_function_prototype(SPIRFunction &func, const Bitset &ret
- 		out_argument += " ";
- 		out_argument += "SPIRV_Cross_return_value";
- 		out_argument += type_to_array_glsl(type);
--		arglist.push_back(move(out_argument));
-+		arglist.push_back(std::move(out_argument));
- 	}
- 
- 	for (auto &arg : func.arguments)
-@@ -4553,7 +4553,7 @@ void CompilerHLSL::require_texture_query_variant(const SPIRType &type)
- 
- string CompilerHLSL::compile(std::vector<HLSLVertexAttributeRemap> vertex_attributes)
- {
--	remap_vertex_attributes = move(vertex_attributes);
-+	remap_vertex_attributes = std::move(vertex_attributes);
- 	return compile();
- }
- 
-diff --git a/spirv_hlsl.hpp b/spirv_hlsl.hpp
-index b2b60fca..3503c674 100644
---- a/spirv_hlsl.hpp
-+++ b/spirv_hlsl.hpp
-@@ -63,7 +63,7 @@ public:
- 	};
- 
- 	explicit CompilerHLSL(std::vector<uint32_t> spirv_)
--	    : CompilerGLSL(move(spirv_))
-+	    : CompilerGLSL(std::move(spirv_))
- 	{
- 	}
- 
-diff --git a/spirv_msl.cpp b/spirv_msl.cpp
-index 0e1e733d..fbfcdba5 100644
---- a/spirv_msl.cpp
-+++ b/spirv_msl.cpp
-@@ -32,7 +32,7 @@ static const uint32_t k_aux_mbr_idx_swizzle_const = 0u;
- 
- CompilerMSL::CompilerMSL(vector<uint32_t> spirv_, vector<MSLVertexAttr> *p_vtx_attrs,
-                          vector<MSLResourceBinding> *p_res_bindings)
--    : CompilerGLSL(move(spirv_))
-+    : CompilerGLSL(std::move(spirv_))
- {
- 	if (p_vtx_attrs)
- 		for (auto &va : *p_vtx_attrs)
-diff --git a/spirv_parser.cpp b/spirv_parser.cpp
-index 1725b4ca..0fcd7691 100644
---- a/spirv_parser.cpp
-+++ b/spirv_parser.cpp
-@@ -24,7 +24,7 @@ namespace spirv_cross
- {
- Parser::Parser(std::vector<uint32_t> spirv)
- {
--	ir.spirv = move(spirv);
-+	ir.spirv = std::move(spirv);
- }
- 
- Parser::Parser(const uint32_t *spirv_data, size_t word_count)
-@@ -223,7 +223,7 @@ void Parser::parse(const Instruction &instruction)
- 	case OpExtension:
- 	{
- 		auto ext = extract_string(ir.spirv, instruction.offset);
--		ir.declared_extensions.push_back(move(ext));
-+		ir.declared_extensions.push_back(std::move(ext));
- 		break;
- 	}
- 
-diff --git a/spirv_reflect.hpp b/spirv_reflect.hpp
-index 13b5b431..f5c6a6ff 100644
---- a/spirv_reflect.hpp
-+++ b/spirv_reflect.hpp
-@@ -34,7 +34,7 @@ class CompilerReflection : public CompilerGLSL
- 
- public:
- 	explicit CompilerReflection(std::vector<uint32_t> spirv_)
--	    : Parent(move(spirv_))
-+	    : Parent(std::move(spirv_))
- 	{
- 		options.vulkan_semantics = true;
- 	}
--- 
-2.37.2
-
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 6aabf2e3b8..26300ecb1d 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -6,14 +6,12 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
 SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;protocol=https;lfs=0 \
-           file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
            file://debugfix.patch \
-           file://0001-Qualify-move-as-std-move.patch;patchdir=third_party/spirv-cross \
            file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch;patchdir=third_party/spdlog \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "8b945bebf8b2fd987dcf0eeca048068adf4ea44d"
+SRCREV = "a42d4eab1e5fe7814dfbe91e3bbaf8ab62cf03f6"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.39.0


